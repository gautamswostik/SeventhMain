// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doctors _$DoctorsFromJson(Map<String, dynamic> json) {
  return Doctors(
    id: json['_id'] as String,
    name: json['name'] as String,
    type: json['type'] as String,
    contacts: json['contacts'] == null
        ? null
        : Contacts.fromJson(json['contacts'] as Map<String, dynamic>),
    working: json['working'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$DoctorsToJson(Doctors instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'contacts': instance.contacts,
      'working': instance.working,
      'description': instance.description,
    };
