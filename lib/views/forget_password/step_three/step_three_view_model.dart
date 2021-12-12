import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/core/models/session_models.dart';
import 'package:book_medial/core/services/ws/ws_auth.dart';
import 'package:book_medial/utils/shared.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StepThreeViewModel extends BaseViewModel {
  StepThreeViewModel();

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

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

  bool get obscureCmp => this._obscureCmp;
  set obscureCmp(bool value) {
    this._obscureCmp = value;
    notifyListeners();
  }

  // Add ViewModel specific code here

  init(context) {
    this.userEmail = ModalRoute.of(context)!.settings.arguments as String?;
    print(this.userEmail);
  }

  send(context) async {
    if (this.formKey.currentState!.saveAndValidate()) {
      Map formData = new Map.from(formKey.currentState!.value);
      print(formData);

      if (formData["password"] != formData["conf_passwd"]) {
        SharedFunc.toast(msg: "Les mots de passe ne sont pas identiques.");
        return;
      }

      this.loader = true;
      formData["email"] = this.userEmail;
      print(formData);
      WsResponse rp = await WsAuth.updatePassword(data: formData);
      print(rp.status);
      print(rp.reponse);
      if (rp.status) {
        SharedFunc.toast(msg: "${rp.message}", toastLength: Toast.LENGTH_LONG);
        Navigator.pop(context);
        Navigator.pop(context);
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
}
