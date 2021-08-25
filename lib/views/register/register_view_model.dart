import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/core/models/session_models.dart';
import 'package:book_medial/core/services/ws/ws_auth.dart';
import 'package:book_medial/utils/shared.dart';
import 'package:book_medial/views/home/home_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';

class RegisterViewModel extends BaseViewModel {
  RegisterViewModel();

  final GlobalKey<FormBuilderState> registerFormKey =
      GlobalKey<FormBuilderState>();

  String _radioChose = "Client";
  bool _isClient = true;

  bool _obscureMp = true;
  bool _obscureCmp = true;

  bool _loader = false;

  bool get loader => this._loader;
  set loader(bool value) {
    this._loader = value;
    notifyListeners();
  }

  String get radioChose => this._radioChose;
  set radioChose(String value) {
    this._radioChose = value;
    notifyListeners();
  }

  bool get isClient => this._isClient;
  set isClient(bool value) {
    this._isClient = value;
    notifyListeners();
  }

  bool get obscureMp => this._obscureMp;
  set obscureMp(bool value) {
    this._obscureMp = value;
    notifyListeners();
  }

  bool get obscureCmp => this._obscureCmp;
  set obscureCmp(bool value) {
    this._obscureCmp = value;
    notifyListeners();
  }

  // Add ViewModel specific code here

  choseUserType(String chose) {
    if (chose == "Client") {
      this.isClient = true;
    } else {
      this.isClient = false;
    }
  }

  register(context) async {
    print("REGISTER");

    if (this.registerFormKey.currentState!.saveAndValidate()) {
      Map registerData = new Map.from(registerFormKey.currentState!.value);
      print(registerData);

      if (registerData["password"] != registerData["conf_passwd"]) {
        SharedFunc.toast(msg: "Les mots de passe ne sont pas identiques.");
        return;
      }

      if (registerData["accept_terms"] == false) {
        SharedFunc.toast(
            msg: "Veuillez accepter les terme et conditions générales.");
        return;
      }
      this.loader = true;
      WsResponse rp = await WsAuth.register(data: registerData);
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
        String? ms =
            "Une erreur est survenus lors de la création du compte, Veuillez Réessayez.";
        if (rp.message != null) ms = rp.message;
        SharedFunc.toast(msg: "$ms", toastLength: Toast.LENGTH_LONG);
      }
    } else {
      SharedFunc.toast(msg: "Veuillez remplir les champs requis.");
    }

    this.loader = false;
  }

  registerGoogle(context) async {
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
      String? ms =
          "une erreur s'est produite lors de la recuperation des données google";
      if (rp.message != null) ms = rp.message;
      SharedFunc.toast(msg: "$ms", toastLength: Toast.LENGTH_LONG);
    }

    this.loader = false;
  }

  registerFacebook(context) async {
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
      String? ms =
          "Une erreur s'est produite lors de la recuperation des données facebook";
      if (rp.message != null) ms = rp.message;
      SharedFunc.toast(msg: "$ms", toastLength: Toast.LENGTH_LONG);
    }

    this.loader = false;
  }
  // Add ViewModel specific code here
}
