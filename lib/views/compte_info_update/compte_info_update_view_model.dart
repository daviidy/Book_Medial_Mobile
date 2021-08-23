import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/core/models/session_models.dart';
import 'package:book_medial/core/services/database_service.dart';
import 'package:book_medial/core/services/ws/ws_auth.dart';
import 'package:book_medial/utils/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CompteInfoUpdateViewModel extends BaseViewModel {
  CompteInfoUpdateViewModel();

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  final DatabaseService storage = new DatabaseService();

  bool _obscureOlMp = true;
  bool _obscureMp = true;
  bool _obscureCmp = true;
  String? userEmail;
  bool _loader = false;

  bool get loader => this._loader;
  set loader(bool value) {
    this._loader = value;
    notifyListeners();
  }

  bool get obscureMp => this._obscureMp;
  set obscureMp(bool value) {
    this._obscureMp = value;
    notifyListeners();
  }

  bool get obscureOlMp => this._obscureOlMp;
  set obscureOlMp(bool value) {
    this._obscureOlMp = value;
    notifyListeners();
  }

  bool get obscureCmp => this._obscureCmp;
  set obscureCmp(bool value) {
    this._obscureCmp = value;
    notifyListeners();
  }

  // Add ViewModel specific code here

  init(context) async {
    this.userEmail = ModalRoute.of(context)!.settings.arguments as String?;
    print(this.userEmail);
  }

  send(context) async {
    this.loader = true;

    if (this.formKey.currentState!.saveAndValidate()) {
      Map formData = new Map.from(formKey.currentState!.value);
      print(formData);

      var userLogin = await storage.getItem("userLogin");

      print(userLogin);

      userLogin['password'] = formData["old_password"];

      WsResponse rpLog = await WsAuth.login(data: userLogin);
      if (!rpLog.status) {
        SharedFunc.toast(msg: "Veuillez entrer un ancien mot de passe valide");
        this.loader = false;
        return;
      }

      if (formData["password"] != formData["conf_passwd"]) {
        SharedFunc.toast(msg: "Les mots de passe ne sont pas identiques.");
        this.loader = false;
        return;
      }

      formData["email"] = this.userEmail;
      print(formData);
      WsResponse rp = await WsAuth.updatePassword(data: formData);
      print(rp.status);
      print(rp.reponse);
      if (rp.status) {
        SharedFunc.toast(msg: "${rp.message}", toastLength: Toast.LENGTH_LONG);
        Navigator.pop(context);
      } else {
        String? ms = "Email invalide";
        if (rp.message != null) ms = rp.message;
        SharedFunc.toast(msg: "$ms", toastLength: Toast.LENGTH_LONG);
      }
    } else {
      SharedFunc.toast(msg: "Veuillez remplir les champs requis.");
    }

    this.loader = false;
  }
  // Add ViewModel specific code here
}
