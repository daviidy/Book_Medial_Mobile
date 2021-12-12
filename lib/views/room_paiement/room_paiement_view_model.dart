import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/core/models/booking_models.dart';
import 'package:book_medial/core/models/propertie_models.dart';
import 'package:book_medial/core/models/session_models.dart';
import 'package:book_medial/widgets/buy_echec_box/buy_echec_box_view.dart';
import 'package:book_medial/widgets/paiement_web/paiement_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

enum BuyMode { orangeM, mtnM, moovM, visaC }

class RoomPaiementViewModel extends BaseViewModel {
  RoomPaiementViewModel();

  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  int _tabIndex = 1;
  double _price = 36.000;
  double _priceBase = 36.000;
  BuyMode _buyMode = BuyMode.orangeM;

  int _amount = 0;
  String _webView = "";
  String _qrcodeLink = "";
  int _nbreChambre = 1;
  FreeRoom _room = FreeRoom(id: 0);
  Property _property = Property(id: 0);
  Booking _booking = Booking();

  bool _buyDone = false;

  VpParam? _param;

  bool get buyDone => this._buyDone;
  set buyDone(bool value) {
    this._buyDone = value;
    notifyListeners();
  }

  VpParam? get param => this._param;
  set param(VpParam? value) {
    this._param = value;
    notifyListeners();
  }

  int get nbreChambre => this._nbreChambre;
  set nbreChambre(int value) {
    this._nbreChambre = value;
    notifyListeners();
  }

  int get amount => this._amount;
  set amount(int value) {
    this._amount = value;
    notifyListeners();
  }

  String get webView => this._webView;
  set webView(String value) {
    this._webView = value;
    notifyListeners();
  }

  String get qrcodeLink => this._qrcodeLink;
  set qrcodeLink(String value) {
    this._qrcodeLink = value;
    notifyListeners();
  }

  FreeRoom get room => this._room;
  set room(FreeRoom value) {
    this._room = value;
    notifyListeners();
  }

  Property get property => this._property;
  set property(Property value) {
    this._property = value;
    notifyListeners();
  }

  Booking get booking => this._booking;
  set booking(Booking value) {
    this._booking = value;
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

  init(context) {
    this.param = ModalRoute.of(context)?.settings.arguments as VpParam;
    this.amount = _param?.data["amount"];
    this.webView = _param?.data["webView"];
    this.qrcodeLink = _param?.data["qrcodeLink"];
    this.room = _param?.data["room"] as FreeRoom;
    this.property = _param?.data["property"] as Property;
    this.booking = _param?.data["booking"] as Booking;
    this.nbreChambre = _param?.data["nbreChambre"];
  }

  openWebView(context) async {
    //this.buyDone = true;

    var res = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return new PaiementWebView(
              url: this.webView, succesUrl: this.qrcodeLink);
        });

    if (res != null) {
      print(res);
      if (res == "success") {
        this.buyDone = true;
      } else {
        await showDialog(
            context: context,
            builder: (BuildContext context) {
              return new BuyEchecBoxView();
            });
      }
    }
  }

  end(context) {
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pop(context);
  }

  // Add ViewModel specific code here
}
