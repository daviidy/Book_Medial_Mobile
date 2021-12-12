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
  String _headerText = "Vous recherchez un endroit où vous évader?";
  String _bottomText =
      "Avec Book Medial, parcourez des centaines de destinations autour de vous ou partout dans le monde";

  final CarouselController controller = CarouselController();

  final DatabaseService storage = new DatabaseService();

  int get current => this._current;
  set current(int value) {
    this._current = value;
    notifyListeners();
  }

  String get headerText => this._headerText;
  set headerText(String value) {
    this._headerText = value;
    notifyListeners();
  }

  String get bottomText => this._bottomText;
  set bottomText(String value) {
    this._bottomText = value;
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

  onPageChanged(index, reason) {
    this.current = index;
    switch (index) {
      case 0:
        this.headerText = "Vous recherchez un endroit où vous évader?";
        this.bottomText = "Avec Book Medial, parcourez des centaines de destinations autour de vous ou partout dans le monde";
        break;
      case 1:
        this.headerText = "Vous recherchez un séjour à la fois confortable et abordable?";
        this.bottomText = "Book Medial vous garantit les meilleurs tarifs disponibles avec une qualité de service satisfaisante";
        break;
      case 2:
        this.headerText = "Vous voulez réserver des séjours sans vous casser la tête?";
        this.bottomText = "Avec Book Medial, chaque réservation se fait instantanément et en quelques clics";
        break;
      default:
    }
  }
}
