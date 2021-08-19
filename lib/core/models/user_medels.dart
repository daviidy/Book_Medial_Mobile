import 'package:json_annotation/json_annotation.dart';

part 'user_medels.g.dart';

@JsonSerializable()
class UserModel {
  int id;
  String? title;
  String name;
  String email;
  // ignore: non_constant_identifier_names
  String? display_name;
  String type;
  String? image;
  String? phone;
  // ignore: non_constant_identifier_names
  String? birth_date;
  String? nationality;
  String? gender;
  String? address;
  // ignore: non_constant_identifier_names
  String? email_verified_at;
  String? language;
  String? currency;
  // ignore: non_constant_identifier_names
  DateTime? created_at;
  // ignore: non_constant_identifier_names
  DateTime? updated_at;
  String? state;

  UserModel(
      {required this.id,
      this.title,
      required this.name,
      required this.email,
      // ignore: non_constant_identifier_names
      this.display_name,
      required this.type,
      this.image,
      this.phone,
      // ignore: non_constant_identifier_names
      this.birth_date,
      this.nationality,
      this.gender,
      this.address,
      // ignore: non_constant_identifier_names
      this.email_verified_at,
      this.language,
      this.currency,
      // ignore: non_constant_identifier_names
      this.created_at,
      // ignore: non_constant_identifier_names
      this.updated_at,
      this.state});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
