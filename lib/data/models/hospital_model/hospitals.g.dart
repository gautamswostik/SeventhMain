// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospitals.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hospitals _$HospitalsFromJson(Map<String, dynamic> json) {
  return Hospitals(
    id: json['_id'] as String,
    name: json['name'] as String,
    services: json['services'] == null
        ? null
        : Services.fromJson(json['services'] as Map<String, dynamic>),
    contactsHos: json['contacts'] == null
        ? null
        : ContactsHos.fromJson(json['contacts'] as Map<String, dynamic>),
    locations: json['locations'] == null
        ? null
        : Locations.fromJson(json['locations'] as Map<String, dynamic>),
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$HospitalsToJson(Hospitals instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'services': instance.services,
      'contacts': instance.contactsHos,
      'locations': instance.locations,
      'description': instance.description,
    };
