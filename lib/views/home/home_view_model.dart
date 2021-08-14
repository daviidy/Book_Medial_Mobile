import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/core/models/room_models.dart';
import 'package:book_medial/core/services/database_service.dart';
import 'package:book_medial/theme/theme.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class HomeViewModel extends BaseViewModel {
  final GlobalKey<FormBuilderState> searchFormKey =
      GlobalKey<FormBuilderState>();

  bool _isLogin = false;

  bool _chowSearchResume = false;

  List<RoomGroup> _roomGroupList = [];

  ScrollController scrollController = new ScrollController(
    initialScrollOffset: 0.0,
    keepScrollOffset: true,
  );

    final DatabaseService storage = new DatabaseService();




  List<RoomGroup> get roomGroupList => this._roomGroupList;
  set roomGroupList(List<RoomGroup> value) {
    this._roomGroupList = value;
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
    
    var session = await this.storage.getItem("isLogin");
    this.isLogin = (session != null) ? session : false ;

    RoomGroupStyle style1 =
        RoomGroupStyle(height: 223, width: AppTheme.fullWidth(context) / 2.8);

    RoomGroupStyle style2 =
        RoomGroupStyle(height: 160, width: AppTheme.fullWidth(context) / 1.3);

    RoomGroup goup1 =
        RoomGroup(title: "Destinations populaires", style: style1, rooms: []);
    for (var i = 0; i < 3; i++) {
      Room room = Room(
          image: "assets/images/intro${i + 1}.png",
          location: "Lieu",
          name: "Nom");
      goup1.rooms.add(room);
    }

    RoomGroup goup2 =
        RoomGroup(title: "Les plus récents", style: style2, rooms: []);
    for (var i = 0; i < 3; i++) {
      Room room = Room(
          image: "assets/images/intro2.png", location: "Lieu", name: "Nom");
      goup2.rooms.add(room);
    }

    this.roomGroupList.add(goup1);
    this.roomGroupList.add(goup2);

    this.scrollController.addListener(() {
      print(this.scrollController.offset);
      if (this.scrollController.offset > 336) {
        this.chowSearchResume = true;
      } else {
        this.chowSearchResume = false;
      }
    });
  }

  moveToTop() {
    this.scrollController.position.animateTo(
          this.scrollController.position.minScrollExtent,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 500),
        );
  }
}
