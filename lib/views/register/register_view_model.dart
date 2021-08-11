import 'package:book_medial/core/base/base_view_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegisterViewModel extends BaseViewModel {
  RegisterViewModel();

  final GlobalKey<FormBuilderState> registerFormKey =
      GlobalKey<FormBuilderState>();

  String _radioChose = "Client";
  bool _isClient = true;

  bool _obscureMp = true;
  bool _obscureCmp = true;

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

    // this.loader = true;
    // if (this.loginFormKey.currentState!.saveAndValidate()) {
    //   Map loginData = new Map.from(loginFormKey.currentState!.value);
    //   Map rp = await WsAuth.login(data: loginData);
    //   print(rp);
    //   if (rp["status"]) {
    //     SharedFunc.toast(msg: "Connecté avec succès");
    //     Navigator.pushReplacementNamed(context, "/main");
    //   } else {
    //     String ms =
    //         "Mot de passe ou Numéro de carte invalide. Veuillez contacter votre assureur";
    //     if (rp["message"] != null) ms = rp["message"];
    //     SharedFunc.toast(msg: "$ms", toastLength: Toast.LENGTH_LONG);
    //   }
    // } else {
    //   SharedFunc.toast(msg: "Veuillez remplir les champs requis.");
    // }

    // this.loader = false;
  }
}
