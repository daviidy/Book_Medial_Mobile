import 'package:json_annotation/json_annotation.dart';

part 'country_models.g.dart';

@JsonSerializable()
class Country {
  String name;
  String alpha2Code;
  String alpha3Code;
  String nativeName;
  String flag;
  List<String> callingCodes;

  Country(
      {required this.alpha2Code,
      required this.alpha3Code,
      required this.callingCodes,
      required this.flag,
      required this.name,
      required this.nativeName});

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

@JsonSerializable()
class CountryList {
  List<Country> countries;

  CountryList({
    required this.countries,
  });

  factory CountryList.fromJson(Map<String, dynamic> json) =>
      _$CountryListFromJson(json);
  Map<String, dynamic> toJson() => _$CountryListToJson(this);
}
