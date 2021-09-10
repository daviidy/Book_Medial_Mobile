import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/core/models/propertie_models.dart';
import 'package:book_medial/core/services/database_service.dart';
import 'package:book_medial/utils/shared.dart';
import 'package:book_medial/widgets/photo_full/photo_full_view.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:map_launcher/map_launcher.dart';

class RoomViewModel extends BaseViewModel {
  RoomViewModel();

  int _menuIndex = 0;
  late Property _property;

  bool _isHotel = false;

  bool _isFavory = false;

  int _current = 0;
  final CarouselController controller = CarouselController();
  final DatabaseService storage = new DatabaseService();

  Property get property => this._property;
  set property(Property value) {
    this._property = value;
    notifyListeners();
  }

  bool get isHotel => this._isHotel;
  set isHotel(bool value) {
    this._isHotel = value;
    notifyListeners();
  }

  bool get isFavory => this._isFavory;
  set isFavory(bool value) {
    this._isFavory = value;
    notifyListeners();
  }

  int get current => this._current;
  set current(int value) {
    this._current = value;
    notifyListeners();
  }

  int get menuIndex => this._menuIndex;
  set menuIndex(int value) {
    this._menuIndex = value;
    notifyListeners();
  }

  // Add ViewModel specific code here

  init(context) {
    this.property = ModalRoute.of(context)?.settings.arguments as Property;
    print("${this.property.medias}");
    print(this.property.property_type!.name!.contains('Hôtel'));
    this.isHotel = this.property.property_type!.name!.contains('Hôtel');
    this.initFavory();
  }

  swithMenu(index) {
    this.menuIndex = index;
  }

  showPhoto(context, Media media) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return PhotoFullView(
            photoUrl: media.link,
            photoTag: media.id.toString(),
          );
        });
  }

  callNumber() async {
    print(this.property.contact_number);
    try {
      bool? res = await FlutterPhoneDirectCaller.callNumber(
          "${this.property.contact_number}");
      print(res);
    } catch (e) {
      print(e);
      SharedFunc.toast(
          msg: "Une erreur s'est produite lors de l'opération",
          toastLength: Toast.LENGTH_LONG);
    }
  }

  openMap() async {
    final availableMaps = await MapLauncher.installedMaps;
    print(
        availableMaps); // [AvailableMap { mapName: Google Maps, mapType: google }, ...]

    try {
      List<Location> propertyLocation =
          await locationFromAddress("${this.property.address}");

      await availableMaps.first.showDirections(
        destination:
            Coords(propertyLocation[0].latitude, propertyLocation[0].longitude),
        destinationTitle: "${this.property.name}",
      );
    } catch (e) {
      print(e);
      SharedFunc.toast(
          msg: "Une erreur s'est produite lors de l'opération",
          toastLength: Toast.LENGTH_LONG);
    }
  }

  addFavory() async {
    FavoryProperty _favoryData = FavoryProperty.fromJson(await this.storage.getItem("favoryData")) ;
    if (this.isFavory) {
      _favoryData.list.removeWhere((p) => p.id == this.property.id);
      await this.storage.setItem("favoryData", _favoryData.toJson());
      this.isFavory = !this.isFavory;
      SharedFunc.toast(msg: "Retirer des favoris");
    } else {
      _favoryData.list.add(this.property);
      await this.storage.setItem("favoryData", _favoryData.toJson());
      this.isFavory = !this.isFavory;
      SharedFunc.toast(msg: "Ajouter aux favoris");
    }
  }

  initFavory() async {
    var favory = await this.storage.getItem("favoryData");
    if (favory != null) {
      FavoryProperty _favoryData = FavoryProperty.fromJson(favory);
      if (_favoryData.list
          .where((p) => p.id == this.property.id)
          .toList()
          .isNotEmpty) {
        this.isFavory = true;
      }
    } else {
      FavoryProperty _favoryData = FavoryProperty(list: []);
      await this.storage.setItem("favoryData", _favoryData.toJson());
    }
  }
}
