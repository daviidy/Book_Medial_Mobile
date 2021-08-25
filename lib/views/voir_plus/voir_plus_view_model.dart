import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/core/models/propertie_models.dart';
import 'package:book_medial/core/models/session_models.dart';
import 'package:book_medial/core/services/ws/ws_property.dart';
import 'package:book_medial/utils/shared.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VoirPlusViewModel extends BaseViewModel {
  VoirPlusViewModel();

  late VpParam _param;

  bool _isLoad = false;

  List<Property> _propertyList = [];
  List<PopularProperty> _categoryList = [];

  bool get isLoad => this._isLoad;
  set isLoad(bool value) {
    this._isLoad = value;
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

  init(context) {
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
      default:
        this.isLoad = true;
    }
  }

  loadPropertyByCity(PopularProperty popular) async {
    this.isLoad = true;
    WsResponse rp = await WsProperty.byCity(popular.city);
    if (rp.status) {
      int i = 0;
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
    Navigator.pushNamed(context, "/room", arguments: property);
  }
}
