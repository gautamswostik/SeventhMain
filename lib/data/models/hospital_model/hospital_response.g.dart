// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HospitalResponse _$HospitalResponseFromJson(Map<String, dynamic> json) {
  return HospitalResponse(
    hospitals: (json['hospitals'] as List)
        ?.map((e) =>
            e == null ? null : Hospitals.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HospitalResponseToJson(HospitalResponse instance) =>
    <String, dynamic>{
      'hospitals': instance.hospitals,
    };
