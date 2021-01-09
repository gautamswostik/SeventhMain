// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hos_apoint_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HospitalAppointmentRespose _$HospitalAppointmentResposeFromJson(
    Map<String, dynamic> json) {
  return HospitalAppointmentRespose(
    hosResponse: (json['hospital_appointments'] as List)
        ?.map((e) => e == null
            ? null
            : HospitalAppointment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HospitalAppointmentResposeToJson(
        HospitalAppointmentRespose instance) =>
    <String, dynamic>{
      'hospital_appointments': instance.hosResponse,
    };
