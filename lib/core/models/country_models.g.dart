// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(
    alpha2Code: json['alpha2Code'] as String,
    alpha3Code: json['alpha3Code'] as String,
    callingCodes: (json['callingCodes'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    flag: json['flag'] as String,
    name: json['name'] as String,
    nativeName: json['nativeName'] as String,
  );
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'alpha2Code': instance.alpha2Code,
      'alpha3Code': instance.alpha3Code,
      'nativeName': instance.nativeName,
      'flag': instance.flag,
      'callingCodes': instance.callingCodes,
    };

CountryList _$CountryListFromJson(Map<String, dynamic> json) {
  return CountryList(
    countries: (json['countries'] as List<dynamic>)
        .map((e) => Country.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CountryListToJson(CountryList instance) =>
    <String, dynamic>{
      'countries': instance.countries,
    };
