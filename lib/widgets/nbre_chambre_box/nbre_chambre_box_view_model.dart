import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/utils/shared.dart';
import 'package:flutter/material.dart';

class NbreChambreBoxViewModel extends BaseViewModel {
  NbreChambreBoxViewModel();
  int _nbrChambre = 1;
  late int nbrMax;

  int get nbrChambre => this._nbrChambre;
  set nbrChambre(int value) {
    this._nbrChambre = value;
    notifyListeners();
  }

  addChambre() {
    if (this.nbrMax > this.nbrChambre) {
      this.nbrChambre++;
    } else {
      SharedFunc.toast(msg: "Il n'y a que $nbrMax chambre(s) disponible");
    }
  }

  rmChambre() {
    if (this.nbrChambre > 1) {
      this.nbrChambre--;
    } else {
      SharedFunc.toast(msg: "Une chambre au minimume est réquis");
    }
  }

  save(context) {
    Navigator.pop(context, this.nbrChambre);
  }
  // Add ViewModel specific code here
}
