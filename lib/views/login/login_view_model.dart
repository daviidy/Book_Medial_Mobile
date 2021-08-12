import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/utils/shared.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginViewModel extends BaseViewModel {
  LoginViewModel();

  final GlobalKey<FormBuilderState> loginFormKey =
      GlobalKey<FormBuilderState>();

  login(context) async {
    print("LOGIN");

    // this.loader = true;
    if (this.loginFormKey.currentState!.saveAndValidate()) {
      Map loginData = new Map.from(loginFormKey.currentState!.value);
      print(loginData);
      Navigator.pushNamed(context, "/home");
      // Map rp = await WsAuth.login(data: loginData);
      // print(rp);
      // if (rp["status"]) {
      //   SharedFunc.toast(msg: "Connecté avec succès");
      //   Navigator.pushReplacementNamed(context, "/main");
      // } else {
      //   String ms =
      //       "Mot de passe ou Numéro de carte invalide. Veuillez contacter votre assureur";
      //   if (rp["message"] != null) ms = rp["message"];
      //   SharedFunc.toast(msg: "$ms", toastLength: Toast.LENGTH_LONG);
      // }
    } else {
      SharedFunc.toast(msg: "Veuillez remplir les champs requis.");
    }

    // this.loader = false;
  }

  // Add ViewModel specific code here
}
