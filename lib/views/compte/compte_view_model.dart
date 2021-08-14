import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/core/services/database_service.dart';
import 'package:book_medial/utils/shared.dart';
import 'package:book_medial/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class CompteViewModel extends BaseViewModel {
  CompteViewModel();

  final ImagePicker _picker = ImagePicker();

  XFile? profilPhoto;

  final DatabaseService storage = new DatabaseService();

  // Add ViewModel specific code here

  logout(context) async {
    await this.storage.setItem("isLogin", false);
    Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(
        builder: (BuildContext context) => HomeView(),
      ),
      (route) => false,);
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
      this.profilPhoto = pickedFile;
      notifyListeners();
    } catch (e) {
      print(e);
      SharedFunc.toast(msg: "Erreur lors de la récupération du fichier");
    }
  }
}
