import 'package:json_annotation/json_annotation.dart';

part 'room_models.g.dart';

@JsonSerializable()
class Room {
  final String name;
  final String image;
  final String location;

  Room({required this.image, required this.location, required this.name});

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
  Map<String, dynamic> toJson() => _$RoomToJson(this);
}

@JsonSerializable()
class RoomGroupStyle {
  final double width;
  final double height;

  RoomGroupStyle({required this.height, required this.width});
  factory RoomGroupStyle.fromJson(Map<String, dynamic> json) =>
      _$RoomGroupStyleFromJson(json);
  Map<String, dynamic> toJson() => _$RoomGroupStyleToJson(this);
}

@JsonSerializable()
class RoomGroup {
  final String title;
  final RoomGroupStyle? style;
  final List<Room> rooms;

  RoomGroup({required this.title, this.style, required this.rooms});
  factory RoomGroup.fromJson(Map<String, dynamic> json) =>
      _$RoomGroupFromJson(json);
  Map<String, dynamic> toJson() => _$RoomGroupToJson(this);
}
