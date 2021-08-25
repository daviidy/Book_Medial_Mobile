// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'propertie_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Property _$PropertyFromJson(Map<String, dynamic> json) {
  return Property(
    id: json['id'] as int,
    facilities: (json['facilities'] as List<dynamic>?)
        ?.map((e) => Facility.fromJson(e as Map<String, dynamic>))
        .toList(),
    bed_room: (json['bed_room'] as List<dynamic>?)
        ?.map((e) => BedRoom.fromJson(e as Map<String, dynamic>))
        .toList(),
    medias: (json['medias'] as List<dynamic>?)
        ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
        .toList(),
    name: json['name'] as String?,
    description: json['description'] as String?,
    address: json['address'] as String?,
    address_2: json['address_2'] as String?,
    type: json['type'] as String?,
    country: json['country'] as String?,
    contact_name: json['contact_name'] as String?,
    contact_number: json['contact_number'] as String?,
    street: json['street'] as String?,
    city: json['city'] as String?,
    price: json['price'] as String?,
    postal_code: json['postal_code'] as String?,
    cancel_days: json['cancel_days'] as String?,
    arrival_hour_from: json['arrival_hour_from'] as String?,
    departure_hour_from: json['departure_hour_from'] as String?,
    user_id: json['user_id'] as int?,
    property_type_id: json['property_type_id'] as int?,
    sub_type_id: json['sub_type_id'] as int?,
    state: json['state'] as String?,
    created_at: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updated_at: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    price_per_day: (json['price_per_day'] as num?)?.toDouble(),
    price_per_night: (json['price_per_night'] as num?)?.toDouble(),
    progress: (json['progress'] as num?)?.toDouble(),
    has_mobile_money: json['has_mobile_money'] as int?,
    has_carte: json['has_carte'] as int?,
    arrival_hour_to: json['arrival_hour_to'] as String?,
    departure_hour_to: json['departure_hour_to'] as String?,
    bath_room: json['bath_room'] as int?,
    property_type: json['property_type'] == null
        ? null
        : PropertyType.fromJson(json['property_type'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PropertyToJson(Property instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'address': instance.address,
      'address_2': instance.address_2,
      'type': instance.type,
      'country': instance.country,
      'contact_name': instance.contact_name,
      'contact_number': instance.contact_number,
      'street': instance.street,
      'city': instance.city,
      'price': instance.price,
      'postal_code': instance.postal_code,
      'cancel_days': instance.cancel_days,
      'arrival_hour_from': instance.arrival_hour_from,
      'departure_hour_from': instance.departure_hour_from,
      'user_id': instance.user_id,
      'property_type_id': instance.property_type_id,
      'sub_type_id': instance.sub_type_id,
      'state': instance.state,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'price_per_day': instance.price_per_day,
      'price_per_night': instance.price_per_night,
      'progress': instance.progress,
      'has_mobile_money': instance.has_mobile_money,
      'has_carte': instance.has_carte,
      'arrival_hour_to': instance.arrival_hour_to,
      'departure_hour_to': instance.departure_hour_to,
      'bath_room': instance.bath_room,
      'property_type': instance.property_type,
      'facilities': instance.facilities,
      'bed_room': instance.bed_room,
      'medias': instance.medias,
    };

PropertyType _$PropertyTypeFromJson(Map<String, dynamic> json) {
  return PropertyType(
    id: json['id'] as int,
    name: json['name'] as String?,
    description: json['description'] as String?,
    created_at: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updated_at: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
  );
}

Map<String, dynamic> _$PropertyTypeToJson(PropertyType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };

Facility _$FacilityFromJson(Map<String, dynamic> json) {
  return Facility(
    id: json['id'] as int,
    name: json['name'] as String?,
    facility_type_id: json['facility_type_id'] as int?,
    created_at: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updated_at: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
  );
}

Map<String, dynamic> _$FacilityToJson(Facility instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'facility_type_id': instance.facility_type_id,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };

Bed _$BedFromJson(Map<String, dynamic> json) {
  return Bed(
    id: json['id'] as int,
    type: json['type'] as String?,
    room_id: json['room_id'] as int?,
    number: json['number'] as int?,
    created_at: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updated_at: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
  );
}

Map<String, dynamic> _$BedToJson(Bed instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'room_id': instance.room_id,
      'number': instance.number,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };

BedRoom _$BedRoomFromJson(Map<String, dynamic> json) {
  return BedRoom(
    id: json['id'] as int,
    beds: (json['beds'] as List<dynamic>?)
        ?.map((e) => Bed.fromJson(e as Map<String, dynamic>))
        .toList(),
    type: json['type'] as String?,
    guests_number: json['guests_number'] as String?,
    sofa_number: json['sofa_number'] as String?,
    property_id: json['property_id'] as int?,
    created_at: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updated_at: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    price_per_day: (json['price_per_day'] as num?)?.toDouble(),
    price_per_night: (json['price_per_night'] as num?)?.toDouble(),
    name: json['name'] as String?,
    bathroom: json['bathroom'] as int?,
    room_type: json['room_type'] as String?,
  );
}

Map<String, dynamic> _$BedRoomToJson(BedRoom instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'guests_number': instance.guests_number,
      'sofa_number': instance.sofa_number,
      'property_id': instance.property_id,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'price_per_day': instance.price_per_day,
      'price_per_night': instance.price_per_night,
      'name': instance.name,
      'bathroom': instance.bathroom,
      'room_type': instance.room_type,
      'beds': instance.beds,
    };

Media _$MediaFromJson(Map<String, dynamic> json) {
  return Media(
    id: json['id'] as int,
    name: json['name'] as String?,
    property_id: json['property_id'] as int?,
    created_at: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updated_at: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    link: json['link'] as String,
  );
}

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'property_id': instance.property_id,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'link': instance.link,
    };

PopularProperty _$PopularPropertyFromJson(Map<String, dynamic> json) {
  return PopularProperty(
    media_link: json['media_link'] as String?,
    booking: json['booking'] as int?,
    hebergement: json['hebergement'] as int?,
    city: json['city'] as String?,
  );
}

Map<String, dynamic> _$PopularPropertyToJson(PopularProperty instance) =>
    <String, dynamic>{
      'media_link': instance.media_link,
      'booking': instance.booking,
      'hebergement': instance.hebergement,
      'city': instance.city,
    };
