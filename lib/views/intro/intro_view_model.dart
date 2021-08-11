import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/theme/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';

class IntroViewModel extends BaseViewModel {
  IntroViewModel();

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
  // Add ViewModel specific code here

  init(context) {
    var height = AppTheme.fullHeight(context);
    var width = AppTheme.fullWidth(context);
    print("@@@@@@@@@ height : $height");
    print("@@@@@@@@@ width  : $width");
  }
}
