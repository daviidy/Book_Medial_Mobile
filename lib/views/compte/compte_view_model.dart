import 'dart:io';

import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/core/models/session_models.dart';
import 'package:book_medial/core/models/user_medels.dart';
import 'package:book_medial/core/services/database_service.dart';
import 'package:book_medial/core/services/ws/ws_auth.dart';
import 'package:book_medial/utils/shared.dart';
import 'package:book_medial/views/home/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';

class CompteViewModel extends BaseViewModel {
  CompteViewModel();

  final ImagePicker _picker = ImagePicker();

  String? _profilPhoto;
  UserModel? _userData;

  final DatabaseService storage = new DatabaseService();

  bool _loader = false;

  bool get loader => this._loader;
  set loader(bool value) {
    this._loader = value;
    notifyListeners();
  }

  String? get profilPhoto => this._profilPhoto;
  set profilPhoto(String? value) {
    this._profilPhoto = value;
    notifyListeners();
  }

  UserModel? get userData => this._userData;
  set userData(UserModel? value) {
    this._userData = value;
    notifyListeners();
  }

  // Add ViewModel specific code here

  init() async {
    this.userData = UserModel.fromJson(await this.storage.getItem("userData"));
    this.profilPhoto = this.userData?.image;
  }

  logout(context) async {
    // await this.storage.clear();
    // await this.storage.deleteItem("favoryData");
    await this.storage.deleteItem("token");
    await this.storage.deleteItem("userData");
    await this.storage.deleteItem("userLogin");
    await this.storage.deleteItem("socialLogin");
    await this.storage.deleteItem("mode");
    await FirebaseAuth.instance.signOut();
    await FacebookAuth.instance.logOut();
    Navigator.pushAndRemoveUntil(
      context,
      PageTransition(type: PageTransitionType.fade, child: HomeView()),
      (route) => false,
    );
  }

  Future<void> updatePhoto(context) async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Modifier la photo'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, ImageSource.camera);
                },
                padding:
                    EdgeInsets.only(top: 0, bottom: 0, left: 30, right: 30),
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: const Text('Caméra'),
                  trailing: Icon(Icons.camera_alt),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, ImageSource.gallery);
                },
                padding:
                    EdgeInsets.only(top: 0, bottom: 0, left: 30, right: 30),
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: const Text('Galerie photo'),
                  trailing: Icon(Icons.photo),
                ),
              ),
            ],
          );
        })) {
      case ImageSource.camera:
        this.pickFile(ImageSource.camera);
        break;
      case ImageSource.gallery:
        this.pickFile(ImageSource.gallery);
        break;
    }
  }

  pickFile(source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
    );
    try {
      if (pickedFile != null) {
        this.saveImage(pickedFile);
      } else {
        SharedFunc.toast(msg: "Erreur lors de la récupération du fichier");
      }
    } catch (e) {
      print(e);
      SharedFunc.toast(msg: "Erreur lors de la récupération du fichier");
    }
  }

  saveImage(XFile pickedFile) async {
    this.loader = true;
    Map _data = {
      "name": this.userData?.name,
      "image": pickedFile.path,
    };

    WsResponse rp = await WsAuth.updateImage(data: _data);
    print(rp.status);
    print(rp.reponse);
    if (rp.status) {
      SharedFunc.toast(msg: "Photo enregistré avec succès");
      this.init();
    } else {
      String? ms = "une erreur s'est produite lors de l'enregistrement";
      if (rp.message != null) ms = rp.message;
      SharedFunc.toast(msg: "$ms", toastLength: Toast.LENGTH_LONG);
    }

    this.loader = false;
  }

  onErrorLoadPhoto(object, stark) {
    this.profilPhoto = null;
    SharedFunc.toast(msg: "Une erreur s'est produite lors du chargement de la photo de profil");
  }
}
