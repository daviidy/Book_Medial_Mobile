import 'package:book_medial/core/base/base_view_model.dart';
import 'package:book_medial/core/models/room_models.dart';
import 'package:flutter/widgets.dart';

class VoirPlusViewModel extends BaseViewModel {
  VoirPlusViewModel();

  RoomGroup? _roomGroup;

  RoomGroup? get roomGroup => this._roomGroup;
  set roomGroup(RoomGroup? value) {
    this._roomGroup = value;
    notifyListeners();
  }

  // Add ViewModel specific code here

  init(context) {
    this.roomGroup = ModalRoute.of(context)?.settings.arguments as RoomGroup?;
  }
}
