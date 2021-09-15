import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/core/models/propertie_models.dart';
import 'package:book_medial/core/models/session_models.dart';
import 'package:book_medial/core/services/database_service.dart';
import 'package:book_medial/core/services/ws/ws_property.dart';
import 'package:book_medial/utils/constant.dart';
import 'package:book_medial/utils/shared.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class VoirPlusViewModel extends BaseViewModel {
  VoirPlusViewModel();

   VpParam _param = new VpParam(label: "", type: VpParamType.category);

  ScrollController scrollController = new ScrollController(
    initialScrollOffset: 0.0,
    keepScrollOffset: true,
  );

  bool _isLoad = false;
  bool _isBackgroundLoad = false;
  int _current_page = 1;
  int _last_page = 1;

  List<Property> _propertyList = [];
  List<PopularProperty> _categoryList = [];

  final DatabaseService storage = new DatabaseService();
  SearchPropertyParam _sPropParam = SearchPropertyParam(locationValue: '',personsValue: '',sejourValue: '');

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

  bool get isBackgroundLoad => this._isBackgroundLoad;
  set isBackgroundLoad(bool value) {
    this._isBackgroundLoad = value;
    notifyListeners();
  }

  List<Property> get propertyList => this._propertyList;
  set propertyList(List<Property> value) {
    this._propertyList = value;
    notifyListeners();
  }

  List<PopularProperty> get categoryList => this._categoryList;
  set categoryList(List<PopularProperty> value) {
    this._categoryList = value;
    notifyListeners();
  }

  VpParam get param => this._param;
  set param(VpParam value) {
    this._param = value;
    notifyListeners();
  }

  // Add ViewModel specific code here

  init(context) async {
    this.sPropParam =
        SearchPropertyParam.fromJson(await this.storage.getItem("searchData"));

    this._param = ModalRoute.of(context)?.settings.arguments as VpParam;
    switch (this.param.type) {
      case VpParamType.category:
        this.categoryList = this._param.data as List<PopularProperty>;
        break;
      case VpParamType.property:
        this.propertyList = this._param.data as List<Property>;
        break;
      case VpParamType.propertyQuery:
        this.loadPropertyByCity(this._param.data);
        break;
      case VpParamType.searchProperty:
        this.isLoad = true;
        this.searchProperty(search: this._param.data);
        break;
      case VpParamType.autourDeMoi:
        this.autourDeMoi(this._param.data);
        break;
      default:
        this.isLoad = true;
    }
  }

  autourDeMoi(param) async {
    this.isLoad = true;

    this.sPropParam = param["seacheData"] as SearchPropertyParam;
    Position currentPosition = param["position"] as Position;

    WsResponse rp = await WsProperty.byCity(this.sPropParam.location);
    if (rp.status) {
      for (var item in rp.reponse!["properties"]) {
        Property _property = Property.fromJson(item);
        final bool isValide =
            await this.calculeDistance(_property, currentPosition);
        if (isValide) {
          this._propertyList.add(_property);
          this.param.type = VpParamType.property;
          this.isLoad = false;
          this.isBackgroundLoad = true;
        }
      }

      this.isBackgroundLoad = false;
    } else {
      // String? ms = "Email invalide";
      // if (rp.message != null) ms = rp.message;
      SharedFunc.toast(
          msg: "Une erreur s'est produite lors de la recuperation des données",
          toastLength: Toast.LENGTH_LONG);
    }

    this.isLoad = false;
  }

  Future<bool> calculeDistance(_property, currentPosition) async {
    try {
      List<Location> propertyLocation =
          await locationFromAddress("${_property.address}");

      double distanceInMeters = Geolocator.distanceBetween(
        currentPosition.latitude,
        currentPosition.longitude,
        propertyLocation[0].latitude,
        propertyLocation[0].longitude,
      );

      if ((distanceInMeters / 1000) <= Constant.limitRayon) {
        return true;
      }
    } catch (e) {
      print(e);
    }

    return false;
  }

  searchProperty(
      {required SearchPropertyParam search,
      Map<String, dynamic>? queryParameters}) async {
    this.sPropParam = search;
    WsResponse rp =
        await WsProperty.search(data: search, queryParameters: queryParameters);
    if (rp.status) {
      this._last_page = rp.reponse!["properties"]["last_page"];
      int _currentP = rp.reponse!["properties"]["current_page"];
      if (_currentP == this._current_page) {
        for (var item in rp.reponse!["properties"]["data"]) {
          this._propertyList.add(Property.fromJson(item));
        }
      }

      this.param.type = VpParamType.property;
      this.isBackgroundLoad = false;

      this.isLoad = false;
      if (this._current_page < this._last_page) {
        if (_currentP == this._current_page) this._current_page++;
        notifyListeners();
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        print("@@@@@@@ PAGE ${this._current_page} @@@@@@@@");
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        //print(this.scrollController.offset);
        this.scrollController.addListener(() async {
          if (this.scrollController.offset ==
                  this.scrollController.position.maxScrollExtent &&
              this.isBackgroundLoad == false) {
            print(true);
            print(this.scrollController.offset);
            print(this.scrollController.position.maxScrollExtent);

            this.isBackgroundLoad = true;
            await this.searchProperty(
                search: search,
                queryParameters: {'page': '${this._current_page}'});
          }
        });
      }
    } else {
      // String? ms = "Email invalide";
      // if (rp.message != null) ms = rp.message;
      this.isLoad = false;
      SharedFunc.toast(
          msg: "Une erreur s'est produite lors de la recuperation des données",
          toastLength: Toast.LENGTH_LONG);
    }

    this.isBackgroundLoad = false;
  }

  loadPropertyByCity(PopularProperty popular) async {
    this.isLoad = true;
    WsResponse rp = await WsProperty.byCity(popular.city);
    if (rp.status) {
      for (var item in rp.reponse!["properties"]) {
        this._propertyList.add(Property.fromJson(item));
      }
      this.param.type = VpParamType.property;
    } else {
      // String? ms = "Email invalide";
      // if (rp.message != null) ms = rp.message;
      SharedFunc.toast(
          msg: "Une erreur s'est produite lors de la recuperation des données",
          toastLength: Toast.LENGTH_LONG);
    }
    this.isLoad = false;
  }

  detailPopular(context, PopularProperty popular) {
    VpParam param = VpParam(
        label: "${popular.city} - ${popular.hebergement} hébergements",
        type: VpParamType.propertyQuery,
        data: popular);
    Navigator.pushNamed(context, "/voir-plus", arguments: param);
  }

  detailProperty(context, Property property) {
    VpParam param = VpParam(
        label: "",
        type: VpParamType.property,
        data: {"property": property, "isBottom": true});
    Navigator.pushNamed(context, "/room", arguments: param);
  }
}
