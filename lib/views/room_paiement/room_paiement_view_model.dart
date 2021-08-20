import 'package:book_medial/core/base/base_view_model.dart';

enum BuyMode { orangeM, mtnM, moovM, visaC }

class RoomPaiementViewModel extends BaseViewModel {
  RoomPaiementViewModel();

  int _tabIndex = 1;
  double _price = 36.000;
  double _priceBase = 36.000;
  BuyMode _buyMode = BuyMode.orangeM;

  bool _buyDone = false;

  bool get buyDone => this._buyDone;
  set buyDone(bool value) {
    this._buyDone = value;
    notifyListeners();
  }

  int get tabIndex => this._tabIndex;
  set tabIndex(int value) {
    this._tabIndex = value;
    notifyListeners();
  }

  BuyMode get buyMode => this._buyMode;
  set buyMode(BuyMode value) {
    this._buyMode = value;
    notifyListeners();
  }

  double get price => this._price;
  set price(double value) {
    this._price = value;
    notifyListeners();
  }

  switchTab(index) {
    this.tabIndex = index;
    this.price = 0;
    if (index == 0) {
      this.price = this._priceBase / 2;
    } else {
      this.price = this._priceBase;
    }
  }

  choseMode(BuyMode mode) {
    this.buyMode = mode;
  }

  buyAcompte(context) {
    this.buyDone = true;
  }

  buyTotal(context) {
    this.buyDone = true;
  }

  // Add ViewModel specific code here
}
