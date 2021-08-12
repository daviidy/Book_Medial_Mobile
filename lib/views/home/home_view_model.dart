import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/core/models/room_models.dart';
import 'package:book_medial/theme/theme.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class HomeViewModel extends BaseViewModel {
  final GlobalKey<FormBuilderState> searchFormKey =
      GlobalKey<FormBuilderState>();

  bool _isLogin = false;

  List<RoomGroup> _roomGroupList = [];

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

  init(context) {
    this.isLogin = true;
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
  }
}
