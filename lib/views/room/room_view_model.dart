import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/core/models/propertie_models.dart';
import 'package:book_medial/widgets/photo_full/photo_full_view.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoomViewModel extends BaseViewModel {
  RoomViewModel();

  int _menuIndex = 0;
  late Property _property;

  final List<String> imgList = [
    'assets/images/intro1.png',
    'assets/images/intro2.png',
    'assets/images/intro3.png',
  ];

  int _current = 0;
  final CarouselController controller = CarouselController();

  Property get property => this._property;
  set property(Property value) {
    this._property = value;
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
  }

  swithMenu(index) {
    this.menuIndex = index;
  }

  showPhoto(context, Media media) async {
     await showDialog(
        context: context,
        builder: (BuildContext context) {
          return PhotoFullView(photoUrl: media.link, photoTag: media.id.toString(),);
        });
  }
}
