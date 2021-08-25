import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/core/models/session_models.dart';
import 'package:book_medial/core/services/ws/ws_auth.dart';
import 'package:book_medial/utils/shared.dart';
import 'package:book_medial/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';

class LoginViewModel extends BaseViewModel {
  LoginViewModel();

  final GlobalKey<FormBuilderState> loginFormKey =
      GlobalKey<FormBuilderState>();

  bool _loader = false;

  bool get loader => this._loader;
  set loader(bool value) {
    this._loader = value;
    notifyListeners();
  }

  login(context) async {
    print("LOGIN");

    this.loader = true;
    if (this.loginFormKey.currentState!.saveAndValidate()) {
      Map loginData = new Map.from(loginFormKey.currentState!.value);
      print(loginData);

      WsResponse rp = await WsAuth.login(data: loginData);
      print(rp.status);
      print(rp.reponse);
      if (rp.status) {
        SharedFunc.toast(msg: "Connecté avec succès");
        Navigator.pushAndRemoveUntil(
          context,
          PageTransition(type: PageTransitionType.fade, child: HomeView()),
          (route) => false,
        );
      } else {
        String? ms = "Mot de passe ou Email invalide";
        if (rp.message != null) ms = rp.message;
        SharedFunc.toast(msg: "$ms", toastLength: Toast.LENGTH_LONG);
      }
    } else {
      SharedFunc.toast(msg: "Veuillez remplir les champs requis.");
    }

    this.loader = false;
  }

  loginGoogle(context) async {
    this.loader = true;
    WsResponse rp = await WsAuth.googleSignIn();
    print(rp.status);
    print(rp.reponse);
    if (rp.status) {
      SharedFunc.toast(msg: "Connecté avec succès");
      Navigator.pushAndRemoveUntil(
        context,
        PageTransition(type: PageTransitionType.fade, child: HomeView()),
        (route) => false,
      );
    } else {
      String? ms = "une erreur s'est produite lors de la recuperation des données google";
      if (rp.message != null) ms = rp.message;
      SharedFunc.toast(msg: "$ms", toastLength: Toast.LENGTH_LONG);
    }

    this.loader = false;
  }

  loginFacebook(context) async {
    this.loader = true;
    WsResponse rp = await WsAuth.facbookSignIn();
    print(rp.status);
    print(rp.reponse);
    if (rp.status) {
      SharedFunc.toast(msg: "Connecté avec succès");
      Navigator.pushAndRemoveUntil(
        context,
        PageTransition(type: PageTransitionType.fade, child: HomeView()),
        (route) => false,
      );
    } else {
      String? ms = "Une erreur s'est produite lors de la recuperation des données facebook";
      if (rp.message != null) ms = rp.message;
      SharedFunc.toast(msg: "$ms", toastLength: Toast.LENGTH_LONG);
    }

    this.loader = false;
  }
  // Add ViewModel specific code here
}
