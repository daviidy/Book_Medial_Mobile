import 'package:book_medial/core/models/propertie_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booking_models.g.dart';

@JsonSerializable()
class Booking {
  int? id;
  String? start_date;
  String? end_date;
  String? memo;
  int? user_id;
  String? serial_number;
  DateTime? created_at;
  DateTime? updated_at;
  String? status;
  String? type_sejour;
  String? startTime;
  String? endTime;
  String? type_paiement;
  String? qrcodeLink;
  List<Property>? property;
  Purchase? purchase;

  Booking(
      {this.id,
      this.start_date,
      this.end_date,
      this.memo,
      this.user_id,
      this.serial_number,
      this.created_at,
      this.updated_at,
      this.status,
      this.type_sejour,
      this.startTime,
      this.endTime,
      this.type_paiement,
      this.qrcodeLink,
      this.property,
      this.purchase});

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);
  Map<String, dynamic> toJson() => _$BookingToJson(this);
}

@JsonSerializable()
class Purchase {
  int? id;
  double? price;
  int? booking_id;
  String? date;
  String? trans_id;
  String? signature;
  String? status;
  DateTime? created_at;
  DateTime? updated_at;
  int? state;
  int? offer_id;
  int? user_id;
  int? reste;

  Purchase({
    this.id,
    this.price,
    this.booking_id,
    this.date,
    this.trans_id,
    this.signature,
    this.status,
    this.created_at,
    this.updated_at,
    this.state,
    this.offer_id,
    this.user_id,
    this.reste,
  });

  factory Purchase.fromJson(Map<String, dynamic> json) =>
      _$PurchaseFromJson(json);
  Map<String, dynamic> toJson() => _$PurchaseToJson(this);
}
