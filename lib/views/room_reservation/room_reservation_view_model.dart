import 'package:book_medial/core/base/base_country.dart';
import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/core/models/country_models.dart';
import 'package:book_medial/core/models/propertie_models.dart';
import 'package:book_medial/core/models/session_models.dart';
import 'package:book_medial/core/models/user_medels.dart';
import 'package:book_medial/core/services/database_service.dart';
import 'package:book_medial/widgets/country_box/country_box_view.dart';
import 'package:book_medial/widgets/nbre_chambre_box/nbre_chambre_box_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
  CountryList _countryList = CountryList.fromJson(COUNTRY_DATA_BASE);
  Country? _country;

  UserModel? _userData;

  DateTime initialDate = DateTime.now();

  String _typeSejour = "long";
  int _nbreChambre = 1;
  TimeOfDay _hArrive = TimeOfDay.now();
  TimeOfDay _hDepart = TimeOfDay.now();

  bool _loader = false;

  bool get loader => this._loader;
  set loader(bool value) {
    this._loader = value;
    notifyListeners();
  }

  String get typeSejour => this._typeSejour;
  set typeSejour(String value) {
    this._typeSejour = value;
    notifyListeners();
  }

  TimeOfDay get hArrive => this._hArrive;
  set hArrive(TimeOfDay value) {
    this._hArrive = value;
    notifyListeners();
  }

  TimeOfDay get hDepart => this._hDepart;
  set hDepart(TimeOfDay value) {
    this._hDepart = value;
    notifyListeners();
  }

  SearchPropertyParam get sPropParam => this._sPropParam;
  set sPropParam(SearchPropertyParam value) {
    this._sPropParam = value;
    notifyListeners();
  }

  UserModel? get userData => this._userData;
  set userData(UserModel? value) {
    this._userData = value;
    notifyListeners();
  }

  bool get isLoad => this._isLoad;
  set isLoad(bool value) {
    this._isLoad = value;
    notifyListeners();
  }

  int get nbreChambre => this._nbreChambre;
  set nbreChambre(int value) {
    this._nbreChambre = value;
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

  Country? get country => this._country;
  set country(Country? value) {
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
    var placeData = await this.storage.getItem("currentPlace");
    if (placeData != null) {
      Placemark? place = Placemark.fromMap(placeData);
      this.country = this
          .countryList
          .countries
          .firstWhere((count) => count.alpha2Code == place.isoCountryCode);
    }

    if (_param.type == VpParamType.bedroom) {
      this.bedRoom = _param.data["bed_rom"] as BedRoom;
      this.isHotel = true;
    }

    this.userData = UserModel.fromJson(await this.storage.getItem("userData"));
  }

  createReservation(context) {
    //Navigator.pushNamed(context, "/room-paiement");
    var formatData = {
      "rooms": [],
      "property": this.property.id,
      "type_sejour": this.typeSejour,
      "startDate": DateFormat('dd/MM/yyyy')
          .format(DateTime.parse(this.sPropParam.sejourStart as String)),
      "endDate": (this.typeSejour == 'long') ? DateFormat('dd/MM/yyyy')
          .format(DateTime.parse(this.sPropParam.sejourEnd as String)) : null,
      "startTime": "${this.hArrive.hour}:${this.hArrive.minute}",
      "endTime": "${this.hDepart.hour}:${this.hDepart.minute}",
    };

    print(formatData);
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

  onDate(context) async {
    try {
      final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: this.initialDate,
        helpText: 'Sélectionnez une date',
        currentDate: this.initialDate,
        initialDate: DateTime.parse(this.sPropParam.sejourStart as String),
        locale: Locale('fr'),
        lastDate: DateTime(this.initialDate.year, this.initialDate.month + 1,
            this.initialDate.day),
      );

      if (picked != null) {
        this.sPropParam.sejourStart = picked.toIso8601String();
        this.sPropParam.sejourValue =
            "${DateFormat('EEE, d MMM, yyyy', 'fr').format(picked)}";
        notifyListeners();
      }
    } catch (e) {
      print(e);
      DateTime _start = this.initialDate;
      DateTime _end = DateTime(_start.year, _start.month, _start.day + 1);

      this.sPropParam.sejourStart = _start.toIso8601String();
      this.sPropParam.sejourEnd = _end.toIso8601String();
      this.sPropParam.sejourValue =
          "${DateFormat('EEE, d MMM, yyyy', 'fr').format(_start)}";
      this.onRangeDate(context);
    }
  }

  onChoiseDate(context) {
    if (this.typeSejour == 'long') {
      this.onRangeDate(context);
    } else {
      this.onDate(context);
    }
  }

  onTime(context, timeFor) async {
    final TimeOfDay? picked = await showTimePicker(
      initialTime: this.hArrive,
      context: context,
    );

    if (picked != null) {
      if (timeFor == 'start') {
        this.hArrive = picked;
      } else {
        this.hDepart = picked;
      }
      print(picked.toString());
    }
  }

  onNbrChambre(context) async {
    var res = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return NbreChambreBoxView();
        });

    if (res != null) {
      this.nbreChambre = res;
    }
  }

  onTypeSejour(context) async {
    var res = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Type de séjour'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 'long');
                },
                padding:
                    EdgeInsets.only(top: 0, bottom: 0, left: 30, right: 30),
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: const Text('Long'),
                  trailing: Icon(Icons.event_available),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 'court');
                },
                padding:
                    EdgeInsets.only(top: 0, bottom: 0, left: 30, right: 30),
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: const Text('Court'),
                  trailing: Icon(Icons.event_available),
                ),
              ),
            ],
          );
        });

    if (res != null) {
      this.typeSejour = res;

      DateTime _start = DateTime.parse(this.sPropParam.sejourStart as String);
      DateTime _end = DateTime.parse(this.sPropParam.sejourEnd as String);

      if (res == 'long') {
        this.sPropParam.sejourValue =
            "${DateFormat('EEE, d MMM, yyyy', 'fr').format(_start)} - ${DateFormat('EEE, d MMM, yyyy', 'fr').format(_end)}";
      } else {
        this.sPropParam.sejourValue =
            "${DateFormat('EEE, d MMM, yyyy', 'fr').format(_start)}";
      }
      notifyListeners();
    }
    print(res);
  }
}
