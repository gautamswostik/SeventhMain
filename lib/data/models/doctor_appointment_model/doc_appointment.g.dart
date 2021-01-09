// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doc_appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorAppointment _$DoctorAppointmentFromJson(Map<String, dynamic> json) {
  return DoctorAppointment(
    id: json['_id'] as String,
    forDoc: json['forDoc'] as String,
    fullName: json['fullName'] as String,
    email: json['email'] as String,
    contact: json['contact'] as int,
    problemDescription: json['problemDescription'] as String,
    date: json['date'] as String,
  );
}

Map<String, dynamic> _$DoctorAppointmentToJson(DoctorAppointment instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'forDoc': instance.forDoc,
      'fullName': instance.fullName,
      'email': instance.email,
      'contact': instance.contact,
      'problemDescription': instance.problemDescription,
      'date': instance.date,
    };
