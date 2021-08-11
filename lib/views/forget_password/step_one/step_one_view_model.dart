import 'package:book_medial/core/base/base_view_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class StepOneViewModel extends BaseViewModel {
  StepOneViewModel();

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  // Add ViewModel specific code here

  send(context) {
    Navigator.pushNamed(context, "/forget-password/step2");
  }
}
