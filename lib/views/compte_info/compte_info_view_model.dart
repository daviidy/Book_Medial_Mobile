import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/utils/shared.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CompteInfoViewModel extends BaseViewModel {
  CompteInfoViewModel();

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  bool _obscureMp = true;
  bool _onUpdate = false;

  bool get obscureMp => this._obscureMp;
  set obscureMp(bool value) {
    this._obscureMp = value;
    notifyListeners();
  }

  bool get onUpdate => this._onUpdate;
  set onUpdate(bool value) {
    this._onUpdate = value;
    notifyListeners();
  }

  // Add ViewModel specific code here

  save(context) {
    Navigator.pop(context);
    SharedFunc.toast(msg: "Mise à jour effectuée avec succès");
  }

  activeUpdate() {
    this.onUpdate = true;
    SharedFunc.toast(msg: "Le champs Mot de passe est active");
  }
}
