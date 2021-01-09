// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Locations _$LocationsFromJson(Map<String, dynamic> json) {
  return Locations(
    country: json['country'] as String,
    city: json['city'] as String,
    subCity: json['sub_city'] as String,
  );
}

Map<String, dynamic> _$LocationsToJson(Locations instance) => <String, dynamic>{
      'country': instance.country,
      'city': instance.city,
      'sub_city': instance.subCity,
    };
