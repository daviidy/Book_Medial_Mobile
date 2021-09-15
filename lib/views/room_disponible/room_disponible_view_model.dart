import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/core/models/propertie_models.dart';
import 'package:book_medial/core/models/session_models.dart';
import 'package:book_medial/core/services/database_service.dart';
import 'package:book_medial/core/services/ws/ws_property.dart';
import 'package:book_medial/utils/shared.dart';
import 'package:book_medial/widgets/nbre_per_box/nbre_per_box_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class RoomDisponibleViewModel extends BaseViewModel {
  RoomDisponibleViewModel();
  bool _isLoad = false;
  bool _isHotel = false;
  bool _isPropDispo = false;
  bool _isActiveSearch = false;
  late Property _property;

  List<FreeRoom>? _freeRoom = [];

  SearchPropertyParam _sPropParam =
      SearchPropertyParam(locationValue: '', personsValue: '', sejourValue: '');
  DateTime initialDate = DateTime.now();
  final DatabaseService storage = new DatabaseService();

  bool _isBottom = true;
  bool get isBottom => this._isBottom;
  set isBottom(bool value) {
    this._isBottom = value;
    notifyListeners();
  }

  SearchPropertyParam get sPropParam => this._sPropParam;
  set sPropParam(SearchPropertyParam value) {
    this._sPropParam = value;
    notifyListeners();
  }

  Property get property => this._property;
  set property(Property value) {
    this._property = value;
    notifyListeners();
  }

  bool get isLoad => this._isLoad;
  set isLoad(bool value) {
    this._isLoad = value;
    notifyListeners();
  }

  bool get isPropDispo => this._isPropDispo;
  set isPropDispo(bool value) {
    this._isPropDispo = value;
    notifyListeners();
  }

  List<FreeRoom>? get freeRoom => this._freeRoom;
  set freeRoom(List<FreeRoom>? value) {
    this._freeRoom = value;
    notifyListeners();
  }

  bool get isActiveSearch => this._isActiveSearch;
  set isActiveSearch(bool value) {
    this._isActiveSearch = value;
    notifyListeners();
  }

  bool get isHotel => this._isHotel;
  set isHotel(bool value) {
    this._isHotel = value;
    notifyListeners();
  }

  // Add ViewModel specific code here

  init(context) async {
    VpParam _param = ModalRoute.of(context)?.settings.arguments as VpParam;
    this.property = _param.data["property"] as Property;
    this.isBottom = _param.data["isBottom"] as bool;

    this.isHotel = this.property.property_type!.name!.contains('Hôtel');
    this.sPropParam =
        SearchPropertyParam.fromJson(await this.storage.getItem("searchData"));
    this.sPropParam.locationValue = this.property.address;
    this.onSearch(context);
  }

  reserver({required BuildContext context, FreeRoom? freeRoom}) {
    VpParam param = VpParam(label: "", type: VpParamType.property);
    if (this.isHotel) {
      param.type = VpParamType.freeRoom;
      param.data = {
        "free_room": freeRoom,
        "property": this.property,
        "sPropParam": this.sPropParam,
        "isBottom": this.isBottom
      };
    } else {
      param.data = {
        "free_room": freeRoom,
        "property": this.property,
        "sPropParam": this.sPropParam,
        "isBottom": this.isBottom
      };
    }
    Navigator.pushNamed(context, "/room-reservation", arguments: param);
  }

  /// ***** Formulaire de recherche ********************/

  onNbrPersonne(context) async {
    var res = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return NbrePerBoxView();
        });

    if (res != null) {
      this.sPropParam.totalPersons = res;
      this.sPropParam.personsValue = "$res personnes";
      print(this.sPropParam.toJson());
      notifyListeners();
    }
  }

  onDate(context) async {
    try {
      final DateTimeRange? picked = await showDateRangePicker(
        context: context,
        firstDate: initialDate,
        helpText: 'Sélectionnez une plage de dates',
        fieldStartHintText: 'Date de début du Séjour',
        fieldEndHintText: 'Date de fin du séjour',
        currentDate: initialDate,
        initialDateRange: DateTimeRange(
            start: DateTime.parse(this.sPropParam.sejourStart as String),
            end: DateTime.parse(this.sPropParam.sejourEnd as String)),
        locale: Locale('fr'),
        lastDate:
            DateTime(initialDate.year, initialDate.month + 1, initialDate.day),
      );

      if (picked != null) {
        this.sPropParam.sejourStart = picked.start.toIso8601String();
        this.sPropParam.sejourEnd = picked.end.toIso8601String();
        this.sPropParam.sejourValue =
            "${DateFormat('dd MMM', 'fr').format(picked.start)} - ${DateFormat('dd MMM', 'fr').format(picked.end)}";
        SearchPropertyParam _sp = new SearchPropertyParam.fromJson(this.sPropParam.toJson());
        await this.storage.setItem("searchData", _sp.toJson());
        notifyListeners();
      }
    } catch (e) {
      print(e);
      DateTime _start = this.initialDate;
      DateTime _end = DateTime(_start.year, _start.month, _start.day + 1);

      this.sPropParam.sejourStart = _start.toIso8601String();
      this.sPropParam.sejourEnd = _end.toIso8601String();
      this.sPropParam.sejourValue =
          "${DateFormat('dd MMM', 'fr').format(_start)} - ${DateFormat('dd MMM', 'fr').format(_end)}";
      this.onDate(context);
    }
  }

  onSearch(context) async {
    this.isActiveSearch = false;
    this.isLoad = true;
    this.freeRoom!.clear();
    WsResponse rp = await WsProperty.disponibility(
        searchData: this.sPropParam, property: this.property);
    if (rp.status) {
      if (rp.reponse!["success"] == true) {
        if (this.isHotel) {
          rp.reponse!["property"].remove("bed_room");
          this.property = Property.fromJson(rp.reponse!["property"]);
          for (var freeRoom in rp.reponse!["free_rooms"]) {
            FreeRoom _free = new FreeRoom.fromJson(freeRoom);
            if (_free.room_type != null) {
              this.freeRoom!.add(_free);
            }
          }
          print(this.freeRoom);
        } else {
          this.isPropDispo = true;
        }
      } else {
        SharedFunc.toast(
            msg: rp.reponse!["message"], toastLength: Toast.LENGTH_LONG);
      }
      print(rp);
    } else {
      // String? ms = "Email invalide";
      // if (rp.message != null) ms = rp.message;
      SharedFunc.toast(
          msg: "Une erreur s'est produite lors de la recuperation des données",
          toastLength: Toast.LENGTH_LONG);
    }
    this.isLoad = false;
  }

  /******* Formulaire de recherche END *******************/
}
