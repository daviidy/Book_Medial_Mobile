import 'package:book_medial/core/base/base_view_model.dart';
import 'package:flutter/widgets.dart';

class StepTwoViewModel extends BaseViewModel {
  StepTwoViewModel();

  final formKey = GlobalKey<FormState>();

  String _codeText = "";

  String get codeText => this._codeText;
  set codeText(String value) {
    this._codeText = value;
    notifyListeners();
  }

  // Add ViewModel specific code here

  send(context) {
    Navigator.pushNamed(context, "/forget-password/step3");
  }

  onChanged(value) {
    print(value);
    //this.codeText = value;
  }
  onCompleted(value) {
    print(value);
    this.codeText = value;
  }
}
