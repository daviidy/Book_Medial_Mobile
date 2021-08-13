import 'package:book_medial/core/base/base_view_model.dart';
import 'package:carousel_slider/carousel_controller.dart';

class RoomViewModel extends BaseViewModel {
  RoomViewModel();

  int _menuIndex = 0;

  final List<String> imgList = [
    'assets/images/intro1.png',
    'assets/images/intro2.png',
    'assets/images/intro3.png',
  ];

  int _current = 0;
  final CarouselController controller = CarouselController();

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

  swithMenu(index) {
    this.menuIndex = index;
  }

}
