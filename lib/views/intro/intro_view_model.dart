import 'package:book_medial/core/base/base_view_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

class IntroViewModel extends BaseViewModel {
  IntroViewModel();

  final List<String> imgList = [
  'assets/images/intro1.svg',
  'assets/images/intro2.svg',
  'assets/images/intro3.svg',
];


  int _current = 0;
  final CarouselController controller = CarouselController();
  

  int get current => this._current;
  set current(int value) {
    this._current = value;
    notifyListeners();
  }
  // Add ViewModel specific code here
}