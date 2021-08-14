import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/core/services/database_service.dart';
import 'package:book_medial/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginViewModel extends BaseViewModel {
  LoginViewModel();

  final GlobalKey<FormBuilderState> loginFormKey =
      GlobalKey<FormBuilderState>();

  final DatabaseService storage = new DatabaseService();

  login(context) async {
    print("LOGIN");

    // this.loader = true;
    if (this.loginFormKey.currentState!.saveAndValidate()) {
      Map loginData = new Map.from(loginFormKey.currentState!.value);
      print(loginData);
      await this.storage.setItem("isLogin", true);
      // Navigator.pushAndRemoveUntil(
      //   context,
      //   MaterialPageRoute(
      //     builder: (BuildContext context) => HomeView(),
      //   ),
      //   (route) => false,
      // );
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
      await this.storage.setItem("isLogin", false);
      // SharedFunc.toast(msg: "Veuillez remplir les champs requis.");
    }

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => HomeView(),
      ),
      (route) => false,
    );

    // this.loader = false;
  }

  // Add ViewModel specific code here
}
