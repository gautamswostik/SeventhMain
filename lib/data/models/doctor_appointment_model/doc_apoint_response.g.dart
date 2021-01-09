// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doc_apoint_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorAppointmentResponse _$DoctorAppointmentResponseFromJson(
    Map<String, dynamic> json) {
  return DoctorAppointmentResponse(
    docAppointment: (json['doctor_appointments'] as List)
        ?.map((e) => e == null
            ? null
            : DoctorAppointment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DoctorAppointmentResponseToJson(
        DoctorAppointmentResponse instance) =>
    <String, dynamic>{
      'doctor_appointments': instance.docAppointment,
    };
