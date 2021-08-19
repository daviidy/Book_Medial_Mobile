import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/core/models/session_models.dart';
import 'package:book_medial/core/services/ws/ws_auth.dart';
import 'package:book_medial/utils/shared.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StepTwoViewModel extends BaseViewModel {
  StepTwoViewModel();

  final formKey = GlobalKey<FormState>();

  String _codeText = "";

  late BuildContext context;
  String? userEmail;

  String get codeText => this._codeText;
  set codeText(String value) {
    this._codeText = value;
    notifyListeners();
  }

  // Add ViewModel specific code here

  bool _loader = false;

  bool get loader => this._loader;
  set loader(bool value) {
    this._loader = value;
    notifyListeners();
  }

  init(context) {
    this.userEmail = ModalRoute.of(context)!.settings.arguments as String?;
    this.codeText = context;
  }

  send(context) async {
    this.loader = true;

    WsResponse rp = await WsAuth.verifCode(this.codeText);
    print(rp.status);
    print(rp.reponse);
    if (rp.status) {
      Navigator.pushNamed(context, "/forget-password/step3",
          arguments: rp.reponse!["email"]);
    } else {
      String? ms = "Code invalide";
      if (rp.message != null) ms = rp.message;
      SharedFunc.toast(msg: "$ms", toastLength: Toast.LENGTH_LONG);
    }

    this.loader = false;
  }

  resendCode() async {
    this.loader = true;

    WsResponse rp = await WsAuth.verifMail(data: {"email": this.userEmail});
    print(rp.status);
    print(rp.reponse);
    if (rp.status) {
      SharedFunc.toast(msg: "${rp.message}", toastLength: Toast.LENGTH_LONG);
    } else {
      String? ms =
          "Une erreur est survenus lors de l'envoi du code, Veuillez Réessayez.";
      if (rp.message != null) ms = rp.message;
      SharedFunc.toast(msg: "$ms", toastLength: Toast.LENGTH_LONG);
    }

    this.loader = false;
  }

  onChanged(value) {
    print(value);
    //this.codeText = value;
  }

  onCompleted(value) {
    print(value);
    this.codeText = value;
    this.send(this.context);
  }
}
