import 'package:json_annotation/json_annotation.dart';
import 'package:seventh_main/data/models/hospital_model/hospitals.dart';

part 'hospital_response.g.dart';

@JsonSerializable()
class HospitalResponse {
  final List<Hospitals> hospitals;

  HospitalResponse({this.hospitals});

  factory HospitalResponse.fromJson(Map<String, dynamic> json) =>
      _$HospitalResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HospitalResponseToJson(this);
}
