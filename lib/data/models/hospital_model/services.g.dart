// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Services _$ServicesFromJson(Map<String, dynamic> json) {
  return Services(
    time: json['time'] as String,
    types: json['types'] == null
        ? null
        : ServiceTypes.fromJson(json['types'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ServicesToJson(Services instance) => <String, dynamic>{
      'time': instance.time,
      'types': instance.types,
    };
