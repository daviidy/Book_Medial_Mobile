import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/core/models/booking_models.dart';
import 'package:book_medial/core/models/user_medels.dart';
import 'package:book_medial/core/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotifyReservViewModel extends BaseViewModel {
  NotifyReservViewModel();

  final DatabaseService storage = new DatabaseService();

  Booking _booking = Booking();
  UserModel? _userData;
  String _duree = "";
  int _nbrJr = 0;

  String get duree => this._duree;
  set duree(String value) {
    this._duree = value;
    notifyListeners();
  }

  int get nbrJr => this._nbrJr;
  set nbrJr(int value) {
    this._nbrJr = value;
    notifyListeners();
  }

  Booking get booking => this._booking;
  set booking(Booking value) {
    this._booking = value;
    notifyListeners();
  }

  UserModel? get userData => this._userData;
  set userData(UserModel? value) {
    this._userData = value;
    notifyListeners();
  }

  // Add ViewModel specific code here

  init(context) async {
    this.booking = ModalRoute.of(context)?.settings.arguments as Booking;
    this.userData = UserModel.fromJson(await this.storage.getItem("userData"));
    List _sd = this.booking.start_date!.split("/");
    List _se = this.booking.end_date!.split("/");

    DateTime _start = DateTime.parse(
        "${_sd[2]}-${_sd[1]}-${_sd[0]}T${this.booking.startTime}:00.000000Z");
    DateTime _end = DateTime.parse(
        "${_se[2]}-${_se[1]}-${_se[0]}T${this.booking.endTime}:00.000000Z");

    DateTimeRange _date = DateTimeRange(start: _start, end: _end);
    print(_date.duration.inDays);
    this.nbrJr = (this.booking.type_sejour == 'long')
        ? _date.duration.inDays
        : _date.duration.inHours;

    this.duree =
        "${DateFormat('dd MMM', 'fr').format(_start)} - ${DateFormat('dd MMM', 'fr').format(_end)}";
  }
}
