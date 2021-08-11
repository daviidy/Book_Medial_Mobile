import 'package:book_medial/core/base/base_view_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class StepThreeViewModel extends BaseViewModel {
  StepThreeViewModel();

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  bool _obscureMp = true;
  bool _obscureCmp = true;

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

  send(context) {
    // Navigator.pushNamed(context, "/forget-password/step3");
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pop(context);
  }
}
