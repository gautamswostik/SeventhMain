import 'package:json_annotation/json_annotation.dart';
import 'hospital_appoitment.dart';
part 'hos_apoint_response.g.dart';

@JsonSerializable()
class HospitalAppointmentRespose {
  @JsonKey(name: 'hospital_appointments')
  final List<HospitalAppointment> hosResponse;

  HospitalAppointmentRespose({
    this.hosResponse,
  });

  factory HospitalAppointmentRespose.fromJson(Map<String, dynamic> json) =>
      _$HospitalAppointmentResposeFromJson(json);

  Map<String, dynamic> toJson() => _$HospitalAppointmentResposeToJson(this);
}
