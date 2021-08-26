import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/core/models/propertie_models.dart';
import 'package:book_medial/core/models/session_models.dart';
import 'package:book_medial/core/models/user_medels.dart';
import 'package:book_medial/core/services/database_service.dart';
import 'package:book_medial/core/services/ws/ws_property.dart';
import 'package:book_medial/utils/shared.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeViewModel extends BaseViewModel {
  final GlobalKey<FormBuilderState> searchFormKey =
      GlobalKey<FormBuilderState>();

  bool _isLogin = false;
  bool _chowSearchResume = false;
  bool _isLoadPopular = false;
  bool _isLoadLast = false;

  List<PopularProperty> _popularData = [];
  List<PopularProperty> _popularDataAll = [];

  List<Property> _lastData = [];
  List<Property> _lastDataAll = [];

  ScrollController scrollController = new ScrollController(
    initialScrollOffset: 0.0,
    keepScrollOffset: true,
  );

  final DatabaseService storage = new DatabaseService();

  List<PopularProperty> get popularData => this._popularData;
  set popularData(List<PopularProperty> value) {
    this._popularData = value;
    notifyListeners();
  }

  List<Property> get lastData => this._lastData;
  set lastData(List<Property> value) {
    this._lastData = value;
    notifyListeners();
  }

  bool get isLoadPopular => this._isLoadPopular;
  set isLoadPopular(bool value) {
    this._isLoadPopular = value;
    notifyListeners();
  }

  bool get isLoadLast => this._isLoadLast;
  set isLoadLast(bool value) {
    this._isLoadLast = value;
    notifyListeners();
  }

  bool get isLogin => this._isLogin;
  set isLogin(bool value) {
    this._isLogin = value;
    notifyListeners();
  }

  bool get chowSearchResume => this._chowSearchResume;
  set chowSearchResume(bool value) {
    this._chowSearchResume = value;
    notifyListeners();
  }

  // ScrollController get scrollController => this._scrollController;
  // set scrollController(ScrollController value) {
  //   this._scrollController = value;
  //   notifyListeners();
  // }

  init(context) async {
    var session = await this.storage.getItem("userData");
    if (session != null) {
      this.isLogin = true;
      UserModel userData = UserModel.fromJson(session);
      print(userData.name);
      this.loadPopular();
      this.loadLast();
    }

    this.scrollController.addListener(() {
      //print(this.scrollController.offset);
      if (this.scrollController.offset > 336) {
        this.chowSearchResume = true;
      } else {
        this.chowSearchResume = false;
      }
    });
  }

  loadPopular() async {
    this.isLoadPopular = true;
    WsResponse rp = await WsProperty.popular();
    if (rp.status) {
      for (var item in rp.reponse!["data"]) {
        this._popularDataAll.add(PopularProperty.fromJson(item));
      }
      this.popularData = this._popularDataAll.take(5).toList();
    } else {
      // String? ms = "Email invalide";
      // if (rp.message != null) ms = rp.message;
      SharedFunc.toast(
          msg: "Une erreur s'est produite lors de la recuperation des données",
          toastLength: Toast.LENGTH_LONG);
    }
    this.isLoadPopular = false;
  }

  loadLast() async {
    this.isLoadLast = true;
    WsResponse rp = await WsProperty.last();
    if (rp.status) {
      for (var item in rp.reponse!["properties"]["data"]) {
        Property property = Property.fromJson(item);
        //if(property.name != null)
        this._lastDataAll.add(property);
      }
      this.lastData = this._lastDataAll.take(4).toList();
    } else {
      // String? ms = "Email invalide";
      // if (rp.message != null) ms = rp.message;
      SharedFunc.toast(
          msg: "Une erreur s'est produite lors de la recuperation des données",
          toastLength: Toast.LENGTH_LONG);
    }
    this.isLoadLast = false;
  }

  morePopular(context) {
    VpParam param = VpParam(
        label: "Destinations populaires",
        type: VpParamType.category,
        data: this._popularDataAll);
    Navigator.pushNamed(context, "/voir-plus", arguments: param);
  }

  detailPopular(context, PopularProperty popular) {
    VpParam param = VpParam(
        label: "${popular.city} - ${popular.hebergement} hébergements",
        type: VpParamType.propertyQuery,
        data: popular);
    Navigator.pushNamed(context, "/voir-plus", arguments: param);
  }

  moreLast(context) {
    VpParam param = VpParam(
        label: "Les plus récents",
        type: VpParamType.property,
        data: this._lastDataAll);
    Navigator.pushNamed(context, "/voir-plus", arguments: param);
  }

  detailProperty(context, Property property) {
    Navigator.pushNamed(context, "/room", arguments: property);
  }

  moveToTop() {
    this.scrollController.position.animateTo(
          this.scrollController.position.minScrollExtent,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 500),
        );
  }

  proxiSearch(context) {}
}
