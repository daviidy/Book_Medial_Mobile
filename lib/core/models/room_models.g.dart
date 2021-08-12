// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) {
  return Room(
    image: json['image'] as String,
    location: json['location'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'location': instance.location,
    };

RoomGroupStyle _$RoomGroupStyleFromJson(Map<String, dynamic> json) {
  return RoomGroupStyle(
    height: (json['height'] as num).toDouble(),
    width: (json['width'] as num).toDouble(),
  );
}

Map<String, dynamic> _$RoomGroupStyleToJson(RoomGroupStyle instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };

RoomGroup _$RoomGroupFromJson(Map<String, dynamic> json) {
  return RoomGroup(
    title: json['title'] as String,
    style: json['style'] == null
        ? null
        : RoomGroupStyle.fromJson(json['style'] as Map<String, dynamic>),
    rooms: (json['rooms'] as List<dynamic>)
        .map((e) => Room.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$RoomGroupToJson(RoomGroup instance) => <String, dynamic>{
      'title': instance.title,
      'style': instance.style,
      'rooms': instance.rooms,
    };
