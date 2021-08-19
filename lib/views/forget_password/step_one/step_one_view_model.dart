import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/core/models/session_models.dart';
import 'package:book_medial/core/services/ws/ws_auth.dart';
import 'package:book_medial/utils/shared.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StepOneViewModel extends BaseViewModel {
  StepOneViewModel();

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  // Add ViewModel specific code here
  bool _loader = false;

  bool get loader => this._loader;
  set loader(bool value) {
    this._loader = value;
    notifyListeners();
  }

  send(context) async {
    this.loader = true;
    if (this.formKey.currentState!.saveAndValidate()) {
      Map formData = new Map.from(formKey.currentState!.value);
      print(formData);

      WsResponse rp = await WsAuth.verifMail(data: formData);
      print(rp.status);
      print(rp.reponse);
      if (rp.status) {
        SharedFunc.toast(msg: "${rp.message}", toastLength: Toast.LENGTH_LONG);
        Navigator.pushNamed(context, "/forget-password/step2", arguments: formData["email"]);
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
}
