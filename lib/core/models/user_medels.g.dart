// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_medels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json['id'] as int,
    title: json['title'] as String?,
    name: json['name'] as String,
    email: json['email'] as String,
    display_name: json['display_name'] as String?,
    type: json['type'] as String,
    image: json['image'] as String?,
    phone: json['phone'] as String?,
    birth_date: json['birth_date'] as String?,
    nationality: json['nationality'] as String?,
    gender: json['gender'] as String?,
    address: json['address'] as String?,
    email_verified_at: json['email_verified_at'] as String?,
    language: json['language'] as String?,
    currency: json['currency'] as String?,
    created_at: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updated_at: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    state: json['state'] as String?,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'name': instance.name,
      'email': instance.email,
      'display_name': instance.display_name,
      'type': instance.type,
      'image': instance.image,
      'phone': instance.phone,
      'birth_date': instance.birth_date,
      'nationality': instance.nationality,
      'gender': instance.gender,
      'address': instance.address,
      'email_verified_at': instance.email_verified_at,
      'language': instance.language,
      'currency': instance.currency,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'state': instance.state,
    };
