import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/core/models/booking_models.dart';
import 'package:book_medial/core/models/propertie_models.dart';
import 'package:book_medial/core/models/session_models.dart';
import 'package:book_medial/core/models/user_medels.dart';
import 'package:book_medial/core/services/database_service.dart';
import 'package:book_medial/core/services/ws/ws_booking.dart';
import 'package:book_medial/utils/shared.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NotifyViewModel extends BaseViewModel {
  NotifyViewModel();
  bool _isLogin = false;
  var userData;

  int _initialIndex = 0;

  List<Booking> _reservList = [];
  List<Booking> _confirmed = [];
  List<Booking> _inprogres = [];
  List<Booking> _cancelled = [];
  FavoryProperty favoryList = FavoryProperty(list: []);

  final DatabaseService storage = new DatabaseService();
  late TabController _tabController;

  bool get isLogin => this._isLogin;
  set isLogin(bool value) {
    this._isLogin = value;
    notifyListeners();
  }

  TabController get tabController => this._tabController;
  set tabController(TabController value) {
    this._tabController = value;
    notifyListeners();
  }

  int get initialIndex => this._initialIndex;
  set initialIndex(int value) {
    this._initialIndex = value;
    notifyListeners();
  }

  List<Booking> get reservList => this._reservList;
  set reservList(List<Booking> value) {
    this._reservList = value;
    notifyListeners();
  }

  List<Booking> get confirmed => this._confirmed;
  set confirmed(List<Booking> value) {
    this._confirmed = value;
    notifyListeners();
  }

  List<Booking> get inprogres => this._inprogres;
  set inprogres(List<Booking> value) {
    this._inprogres = value;
    notifyListeners();
  }

  List<Booking> get cancelled => this._cancelled;
  set cancelled(List<Booking> value) {
    this._cancelled = value;
    notifyListeners();
  }

  // Add ViewModel specific code here

  init(context) async {
    this.tabController.index = 0;
    int? _index = ModalRoute.of(context)?.settings.arguments as int?;
    if (_index != null) {
      this.tabController.index = _index;
    }

    await this.initFavory();
    await this.loadBooking();
  }

  detailProperty(context, Property property) {
    VpParam param = VpParam(
        label: "",
        type: VpParamType.property,
        data: {"property": property, "isBottom": false});
    Navigator.pushNamed(context, "/room", arguments: param);
  }

  initFavory() async {
    var favory = await this.storage.getItem("favoryData");
    print(favory);
    if (favory != null) {
      this.favoryList = FavoryProperty.fromJson(favory);
      this.favoryList.list.sort((a, b) => this.favoryList.list.indexOf(b).compareTo(this.favoryList.list.indexOf(a)));
    } else {
      FavoryProperty _favoryData = FavoryProperty(list: []);
      await this.storage.setItem("favoryData", _favoryData.toJson());
    }
  }

  loadBooking() async {
    this.isLogin = true;
    WsResponse rp = await WsBooking.users();
    print(rp.status);
    print(rp.reponse);
    if (rp.status) {
      for (var item in rp.reponse!["bookings"]["confirmed"]) {
        this.confirmed.add(Booking.fromJson(item));
      }

      for (var item in rp.reponse!["bookings"]["inprogres"]) {
        this.inprogres.add(Booking.fromJson(item));
      }

      for (var item in rp.reponse!["bookings"]["cancelled"]) {
        this.cancelled.add(Booking.fromJson(item));
      }

      this.reservList = this.confirmed + this.inprogres + this.cancelled;
    } else {
      String? ms =
          "une erreur s'est produite lors de la recuperation des données";
      if (rp.message != null) ms = rp.message;
      SharedFunc.toast(msg: "$ms", toastLength: Toast.LENGTH_LONG);
    }

    this.isLogin = false;
  }
}
