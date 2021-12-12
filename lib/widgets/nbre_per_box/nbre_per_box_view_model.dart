import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/utils/shared.dart';
import 'package:flutter/material.dart';

class NbrePerBoxViewModel extends BaseViewModel {
  NbrePerBoxViewModel();

  int _nbrTotal = 0;
  int _nbrAdulte = 2;
  int _nbrEnfant = 0;

  int get nbrTotal => this._nbrTotal;
  set nbrTotal(int value) {
    this._nbrTotal = value;
    notifyListeners();
  }

  int get nbrAdulte => this._nbrAdulte;
  set nbrAdulte(int value) {
    this._nbrAdulte = value;
    notifyListeners();
  }

  int get nbrEnfant => this._nbrEnfant;
  set nbrEnfant(int value) {
    this._nbrEnfant = value;
    notifyListeners();
  }

  addAdulte() {
    this.nbrAdulte++;
  }

  rmAdulte() {
    if (this.nbrAdulte > 1) {
      this.nbrAdulte--;
    } else {
      SharedFunc.toast(msg: "Un adulte au minimume est réquis");
    }
  }

  addEnfant() {
    this.nbrEnfant++;
  }

  rmEnfant() {
     if (this.nbrEnfant > 0)
      this.nbrEnfant--;
   
  }

  save(context) {
    this._nbrTotal = this.nbrAdulte + this.nbrEnfant ;
    Navigator.pop(context, this.nbrTotal);
  }

  // Add ViewModel specific code here
}