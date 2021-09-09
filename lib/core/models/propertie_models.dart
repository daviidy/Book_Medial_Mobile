import 'package:json_annotation/json_annotation.dart';

part 'propertie_models.g.dart';

@JsonSerializable()
class Property {
  int id;
  String? name;
  String? description;
  String? address;
  String? address_2;
  String? type;
  String? country;
  String? contact_name;
  String? contact_number;
  String? street;
  String? city;
  String? price;
  String? postal_code;
  String? cancel_days;
  String? arrival_hour_from;
  String? departure_hour_from;
  int? user_id;
  int? property_type_id;
  int? sub_type_id;
  String? state;
  DateTime? created_at;
  DateTime? updated_at;
  double? price_per_day;
  double? price_per_night;
  double? progress;
  int? has_mobile_money;
  int? has_carte;
  String? arrival_hour_to;
  String? departure_hour_to;
  int? bath_room;
  PropertyType? property_type;
  List<Facility>? facilities;
  List<BedRoom>? bed_room;
  List<Media>? medias;

  Property({
    required this.id,
    this.facilities,
    this.bed_room,
    this.medias,
    this.name,
    this.description,
    this.address,
    this.address_2,
    this.type,
    this.country,
    this.contact_name,
    this.contact_number,
    this.street,
    this.city,
    this.price,
    this.postal_code,
    this.cancel_days,
    this.arrival_hour_from,
    this.departure_hour_from,
    this.user_id,
    this.property_type_id,
    this.sub_type_id,
    this.state,
    this.created_at,
    this.updated_at,
    this.price_per_day,
    this.price_per_night,
    this.progress,
    this.has_mobile_money,
    this.has_carte,
    this.arrival_hour_to,
    this.departure_hour_to,
    this.bath_room,
    this.property_type,
  });

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);
  Map<String, dynamic> toJson() => _$PropertyToJson(this);
}

@JsonSerializable()
class PropertyType {
  int id;
  String? name;
  String? description;
  DateTime? created_at;
  DateTime? updated_at;

  PropertyType({
    required this.id,
    this.name,
    this.description,
    this.created_at,
    this.updated_at,
  });

  factory PropertyType.fromJson(Map<String, dynamic> json) =>
      _$PropertyTypeFromJson(json);
  Map<String, dynamic> toJson() => _$PropertyTypeToJson(this);
}

@JsonSerializable()
class Facility {
  int id;
  String? name;
  int? facility_type_id;
  DateTime? created_at;
  DateTime? updated_at;

  Facility({
    required this.id,
    this.name,
    this.facility_type_id,
    this.created_at,
    this.updated_at,
  });

  factory Facility.fromJson(Map<String, dynamic> json) =>
      _$FacilityFromJson(json);
  Map<String, dynamic> toJson() => _$FacilityToJson(this);
}

@JsonSerializable()
class Bed {
  int id;
  String? type;
  int? room_id;
  int? number;
  DateTime? created_at;
  DateTime? updated_at;

  Bed({
    required this.id,
    this.type,
    this.room_id,
    this.number,
    this.created_at,
    this.updated_at,
  });

  factory Bed.fromJson(Map<String, dynamic> json) => _$BedFromJson(json);
  Map<String, dynamic> toJson() => _$BedToJson(this);
}

@JsonSerializable()
class BedRoom {
  int id;
  String? type;
  String? guests_number;
  String? sofa_number;
  int? property_id;
  DateTime? created_at;
  DateTime? updated_at;
  double? price_per_day;
  double? price_per_night;
  String? name;
  int? bathroom;
  String? room_type;
  List<Bed>? beds;

  BedRoom({
    required this.id,
    this.beds,
    this.type,
    this.guests_number,
    this.sofa_number,
    this.property_id,
    this.created_at,
    this.updated_at,
    this.price_per_day,
    this.price_per_night,
    this.name,
    this.bathroom,
    this.room_type,
  });

  factory BedRoom.fromJson(Map<String, dynamic> json) =>
      _$BedRoomFromJson(json);
  Map<String, dynamic> toJson() => _$BedRoomToJson(this);
}

@JsonSerializable()
class FreeRoom {
  int id;
  String? type;
  String? guests_number;
  String? sofa_number;
  int? property_id;
  DateTime? created_at;
  DateTime? updated_at;
  double? price_per_day;
  double? price_per_night;
  String? name;
  int? bathroom;
  RoomType? room_type;
  int? room_type_id;
  int? total_record;
  List<Bed>? beds;

  FreeRoom({
    required this.id,
    this.beds,
    this.type,
    this.guests_number,
    this.sofa_number,
    this.property_id,
    this.created_at,
    this.updated_at,
    this.price_per_day,
    this.price_per_night,
    this.name,
    this.bathroom,
    this.room_type,
    this.room_type_id,
    this.total_record,
  });

  factory FreeRoom.fromJson(Map<String, dynamic> json) =>
      _$FreeRoomFromJson(json);
  Map<String, dynamic> toJson() => _$FreeRoomToJson(this);
}

@JsonSerializable()
class RoomType {
  int id;
  String? name;
  DateTime? created_at;
  DateTime? updated_at;

  RoomType({
    required this.id,
    this.name,
    this.created_at,
    this.updated_at,
  });

  factory RoomType.fromJson(Map<String, dynamic> json) =>
      _$RoomTypeFromJson(json);
  Map<String, dynamic> toJson() => _$RoomTypeToJson(this);
}

@JsonSerializable()
class Media {
  int id;
  String? name;
  int? property_id;
  DateTime? created_at;
  DateTime? updated_at;
  String link;

  Media({
    required this.id,
    this.name,
    this.property_id,
    this.created_at,
    this.updated_at,
    required this.link,
  });

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
  Map<String, dynamic> toJson() => _$MediaToJson(this);
}

@JsonSerializable()
class PopularProperty {
  String? media_link;
  int? booking;
  int? hebergement;
  String? city;

  PopularProperty({
    this.media_link,
    this.booking,
    this.hebergement,
    this.city,
  });

  factory PopularProperty.fromJson(Map<String, dynamic> json) =>
      _$PopularPropertyFromJson(json);
  Map<String, dynamic> toJson() => _$PopularPropertyToJson(this);
}

@JsonSerializable()
class SearchPropertyParam {
  String? location;
  String? sejourStart;
  String? sejourEnd;
  int? totalPersons;
  String? personsValue;
  String? sejourValue;
  String? locationValue;

  SearchPropertyParam({
    this.location,
    this.sejourStart,
    this.sejourEnd,
    this.totalPersons,
    this.personsValue,
    this.sejourValue,
    this.locationValue,
  });

  factory SearchPropertyParam.fromJson(Map<String, dynamic> json) =>
      _$SearchPropertyParamFromJson(json);
  Map<String, dynamic> toJson() => _$SearchPropertyParamToJson(this);
}
