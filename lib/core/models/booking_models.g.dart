// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Booking _$BookingFromJson(Map<String, dynamic> json) {
  return Booking(
    id: json['id'] as int?,
    start_date: json['start_date'] as String?,
    end_date: json['end_date'] as String?,
    memo: json['memo'] as String?,
    user_id: json['user_id'] as int?,
    serial_number: json['serial_number'] as String?,
    created_at: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updated_at: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    status: json['status'] as String?,
    type_sejour: json['type_sejour'] as String?,
    startTime: json['startTime'] as String?,
    endTime: json['endTime'] as String?,
    type_paiement: json['type_paiement'] as String?,
    qrcodeLink: json['qrcodeLink'] as String?,
    property: (json['property'] as List<dynamic>?)
        ?.map((e) => Property.fromJson(e as Map<String, dynamic>))
        .toList(),
    purchase: json['purchase'] == null
        ? null
        : Purchase.fromJson(json['purchase'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
      'id': instance.id,
      'start_date': instance.start_date,
      'end_date': instance.end_date,
      'memo': instance.memo,
      'user_id': instance.user_id,
      'serial_number': instance.serial_number,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'status': instance.status,
      'type_sejour': instance.type_sejour,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'type_paiement': instance.type_paiement,
      'qrcodeLink': instance.qrcodeLink,
      'property': instance.property,
      'purchase': instance.purchase,
    };

Purchase _$PurchaseFromJson(Map<String, dynamic> json) {
  return Purchase(
    id: json['id'] as int?,
    price: (json['price'] as num?)?.toDouble(),
    booking_id: json['booking_id'] as int?,
    date: json['date'] as String?,
    trans_id: json['trans_id'] as String?,
    signature: json['signature'] as String?,
    status: json['status'] as String?,
    created_at: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updated_at: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    state: json['state'] as int?,
    offer_id: json['offer_id'] as int?,
    user_id: json['user_id'] as int?,
    reste: json['reste'] as int?,
  );
}

Map<String, dynamic> _$PurchaseToJson(Purchase instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'booking_id': instance.booking_id,
      'date': instance.date,
      'trans_id': instance.trans_id,
      'signature': instance.signature,
      'status': instance.status,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'state': instance.state,
      'offer_id': instance.offer_id,
      'user_id': instance.user_id,
      'reste': instance.reste,
    };
