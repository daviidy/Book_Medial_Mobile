import 'package:book_medial/core/base/base_country.dart';
import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/core/models/country_models.dart';
import 'package:book_medial/core/models/propertie_models.dart';
import 'package:book_medial/core/models/session_models.dart';
import 'package:book_medial/core/services/database_service.dart';
import 'package:book_medial/widgets/country_box/country_box_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';

class RoomReservationViewModel extends BaseViewModel {
  RoomReservationViewModel();
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  final DatabaseService storage = new DatabaseService();

  bool _isHotel = false;
  bool _isLoad = false;
  bool _isAccount = false;

  SearchPropertyParam _sPropParam =
      SearchPropertyParam(locationValue: '', personsValue: '', sejourValue: '');

  late Property _property;
  late BedRoom _bedRoom;
  late CountryList _countryList;
  late Country _country;

  DateTime initialDate = DateTime.now();

  SearchPropertyParam get sPropParam => this._sPropParam;
  set sPropParam(SearchPropertyParam value) {
    this._sPropParam = value;
    notifyListeners();
  }

  bool get isLoad => this._isLoad;
  set isLoad(bool value) {
    this._isLoad = value;
    notifyListeners();
  }

  bool get isAccount => this._isAccount;
  set isAccount(bool value) {
    this._isAccount = value;
    notifyListeners();
  }

  CountryList get countryList => this._countryList;
  set countryList(CountryList value) {
    this._countryList = value;
    notifyListeners();
  }

  Country get country => this._country;
  set country(Country value) {
    this._country = value;
    notifyListeners();
  }

  bool get isHotel => this._isHotel;
  set isHotel(bool value) {
    this._isHotel = value;
    notifyListeners();
  }

  Property get property => this._property;
  set property(Property value) {
    this._property = value;
    notifyListeners();
  }

  BedRoom get bedRoom => this._bedRoom;
  set bedRoom(BedRoom value) {
    this._bedRoom = value;
    notifyListeners();
  }

  // Add ViewModel specific code here

  init(context) async {
    VpParam _param = ModalRoute.of(context)?.settings.arguments as VpParam;
    this.property = _param.data["property"] as Property;
    this.sPropParam = _param.data["sPropParam"] as SearchPropertyParam;
    DateTime _start = DateTime.parse(this.sPropParam.sejourStart as String);
    DateTime _end = DateTime.parse(this.sPropParam.sejourEnd as String);
    this.sPropParam.sejourValue =
        "${DateFormat('EEE, d MMM, yyyy', 'fr').format(_start)} - ${DateFormat('EEE, d MMM, yyyy', 'fr').format(_end)}";

    this.countryList = CountryList.fromJson(COUNTRY_DATA_BASE);
    this.country = this
        .countryList
        .countries
        .firstWhere((count) => count.alpha2Code == 'CI');

    Placemark? place = await this.storage.getItem("currentPlace");
    if (place != null) {
      this.country = this
          .countryList
          .countries
          .firstWhere((count) => count.alpha2Code == 'CI');
    }

    if (_param.type == VpParamType.bedroom) {
      this.bedRoom = _param.data["bed_rom"] as BedRoom;
      this.isHotel = true;
    }
  }

  createReservation(context) {
    Navigator.pushNamed(context, "/room-paiement");
  }

  choseModeBuy(bool isAccouny) {
    this.isAccount = isAccouny;
  }

  countryFlag(context) async {
    Country? res = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CountryBoxView();
        });

    if (res != null) {
      this.country = this
          .countryList
          .countries
          .firstWhere((count) => count.alpha2Code == res.alpha2Code);
    }
  }

  onRangeDate(context) async {
    try {
      final DateTimeRange? picked = await showDateRangePicker(
        context: context,
        firstDate: this.initialDate,
        helpText: 'Sélectionnez une plage de dates',
        fieldStartHintText: 'Date de début du Séjour',
        fieldEndHintText: 'Date de fin du séjour',
        currentDate: this.initialDate,
        initialDateRange: DateTimeRange(
            start: DateTime.parse(this.sPropParam.sejourStart as String),
            end: DateTime.parse(this.sPropParam.sejourEnd as String)),
        locale: Locale('fr'),
        lastDate: DateTime(this.initialDate.year, this.initialDate.month + 1,
            this.initialDate.day),
      );

      if (picked != null) {
        this.sPropParam.sejourStart = picked.start.toIso8601String();
        this.sPropParam.sejourEnd = picked.end.toIso8601String();
        this.sPropParam.sejourValue =
            "${DateFormat('EEE, d MMM, yyyy', 'fr').format(picked.start)} - ${DateFormat('EEE, d MMM, yyyy', 'fr').format(picked.end)}";
        notifyListeners();
      }
    } catch (e) {
      print(e);
      DateTime _start = this.initialDate;
      DateTime _end = DateTime(_start.year, _start.month, _start.day + 1);

      this.sPropParam.sejourStart = _start.toIso8601String();
      this.sPropParam.sejourEnd = _end.toIso8601String();
      this.sPropParam.sejourValue =
          "${DateFormat('EEE, d MMM, yyyy', 'fr').format(_start)} - ${DateFormat('EEE, d MMM, yyyy', 'fr').format(_end)}";
      this.onRangeDate(context);
    }
  }
}
