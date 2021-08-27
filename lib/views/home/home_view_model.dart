import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/core/models/propertie_models.dart';
import 'package:book_medial/core/models/session_models.dart';
import 'package:book_medial/core/models/user_medels.dart';
import 'package:book_medial/core/services/database_service.dart';
import 'package:book_medial/core/services/ws/ws_property.dart';
import 'package:book_medial/utils/constant.dart';
import 'package:book_medial/utils/shared.dart';
import 'package:book_medial/widgets/google_search_box/google_search_box_view.dart';
import 'package:book_medial/widgets/nbre_per_box/nbre_per_box_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/geocoding.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:intl/intl.dart';

class HomeViewModel extends BaseViewModel {
  final GlobalKey<FormBuilderState> searchFormKey =
      GlobalKey<FormBuilderState>();

  final geocoding = new GoogleMapsGeocoding(apiKey: Constant.kGoogleApiKey);
  final places = new GoogleMapsPlaces(apiKey: Constant.kGoogleApiKey);

  bool _isLogin = false;
  bool _chowSearchResume = false;
  bool _isLoadPopular = false;
  bool _isLoadLast = false;

  List<PopularProperty> _popularData = [];
  List<PopularProperty> _popularDataAll = [];

  List<Property> _lastData = [];
  List<Property> _lastDataAll = [];

  Position? _currentPosition;

  SearchPropertyParam sPropParam = SearchPropertyParam();
  DateTime initialDate = DateTime.now();

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

    this.initSearch();
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

  /// ***** Formulaire de recherche ********************/

  initSearch() async {
    DateTime _start = this.initialDate;
    DateTime _end = DateTime(_start.year, _start.month, _start.day + 1);

    this.sPropParam.sejourStart = _start.toIso8601String();
    this.sPropParam.sejourEnd = _end.toIso8601String();
    this.sPropParam.sejourValue =
        "${DateFormat('dd MMM', 'fr').format(_start)} - ${DateFormat('dd MMM', 'fr').format(_end)}";

    this.sPropParam.totalPersons = 2;
    this.sPropParam.personsValue = "2 personnes";
    this.sPropParam.locationValue = "---";

    this._currentPosition = await this.getPosition();
    if (this._currentPosition != null) {
      print("this._currentPosition");
      print(this._currentPosition!.toJson());

      try {
        List<Placemark> placemarks = await placemarkFromCoordinates(
          this._currentPosition!.latitude,
          this._currentPosition!.longitude,
        );

        this.sPropParam.locationValue =
            "${placemarks.first.subAdministrativeArea}";
        this.sPropParam.location = "${placemarks.first.subAdministrativeArea}";
        notifyListeners();
        print(placemarks[0]);
      } catch (err) {
        print(err);
      }
    }

    print(this._currentPosition);
  }

  initGeocoding() {}

  Future<Position?> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        SharedFunc.toast(
            msg: "Les autorisations de localisation sont refusées",
            toastLength: Toast.LENGTH_LONG);

        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      SharedFunc.toast(
          msg:
              "Les autorisations de localisation sont définitivement refusées, nous ne pouvons pas demander d'autorisations.",
          toastLength: Toast.LENGTH_LONG);

      return null;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  onDestination(context) async {
    PlacesSearchResult? res = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return GoogleSearchBoxView();
        });
    if (res != null) {
      try {
        List<Placemark> placemarks = await placemarkFromCoordinates(
          res.geometry!.location.lat,
          res.geometry!.location.lng,
        );

        this.sPropParam.locationValue = res.formattedAddress;
        this.sPropParam.location = "${placemarks.first.subAdministrativeArea}";
        notifyListeners();
        print(placemarks[0]);
      } catch (err) {
        print(err);
      }
    }
  }

  onNbrPersonne(context) async {
    var res = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return NbrePerBoxView();
        });
  }

  onDate(context) async {
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
      notifyListeners();
    }
  }

  onSearch(context) {}

  /******* Formulaire de recherche END *******************/

}
