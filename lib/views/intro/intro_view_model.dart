import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/core/models/user_medels.dart';
import 'package:book_medial/core/services/database_service.dart';
import 'package:book_medial/theme/theme.dart';
import 'package:book_medial/views/home/home_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';

class IntroViewModel extends BaseViewModel {
  IntroViewModel();

  final List<String> imgList = [
    'assets/images/intro1.png',
    'assets/images/intro2.png',
    'assets/images/intro3.png',
  ];

  int _current = 0;
  final CarouselController controller = CarouselController();

  final DatabaseService storage = new DatabaseService();

  int get current => this._current;
  set current(int value) {
    this._current = value;
    notifyListeners();
  }
  // Add ViewModel specific code here

  init(context) async {
    var height = AppTheme.fullHeight(context);
    var width = AppTheme.fullWidth(context);
    print("@@@@@@@@@ height : $height");
    print("@@@@@@@@@ width  : $width");

    var session = await this.storage.getItem("userData");
    if (session != null) {
      UserModel userData = UserModel.fromJson(session);
      print(userData.name);
      Navigator.pushAndRemoveUntil(
        context,
        PageTransition(type: PageTransitionType.fade, child: HomeView()),
        (route) => false,
      );
    }
  }
}
