import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/core/models/user_medels.dart';
import 'package:book_medial/core/services/database_service.dart';
import 'package:book_medial/utils/shared.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CompteInfoViewModel extends BaseViewModel {
  CompteInfoViewModel();

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  final DatabaseService storage = new DatabaseService();

  bool _obscureMp = true;
  bool _onUpdate = false;
  UserModel? _userData;

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

  UserModel? get userData => this._userData;
  set userData(UserModel? value) {
    this._userData = value;
    notifyListeners();
  }

  // Add ViewModel specific code here

  init() async {
    this.userData = UserModel.fromJson(await this.storage.getItem("userData"));
  }
  save(context) {
    Navigator.pop(context);
    SharedFunc.toast(msg: "Mise à jour effectuée avec succès");
  }

  activeUpdate(context) {
    this.onUpdate = true;
    SharedFunc.toast(msg: "Le champs Mot de passe est active");
  }
}
