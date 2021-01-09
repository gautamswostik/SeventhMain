// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_appoitment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HospitalAppointment _$HospitalAppointmentFromJson(Map<String, dynamic> json) {
  return HospitalAppointment(
    id: json['_id'] as String,
    forHos: json['forHos'] as String,
    fullName: json['fullName'] as String,
    email: json['email'] as String,
    contact: json['contact'] as String,
    problemCatagory: json['problemCatagory'] as String,
    problemDescription: json['problemDescription'] as String,
    date: json['date'] as String,
  );
}

Map<String, dynamic> _$HospitalAppointmentToJson(
        HospitalAppointment instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'forHos': instance.forHos,
      'fullName': instance.fullName,
      'email': instance.email,
      'contact': instance.contact,
      'problemCatagory': instance.problemCatagory,
      'problemDescription': instance.problemDescription,
      'date': instance.date,
    };
