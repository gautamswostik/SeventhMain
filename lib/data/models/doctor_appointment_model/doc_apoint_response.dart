import 'package:json_annotation/json_annotation.dart';
import 'doc_appointment.dart';
part 'doc_apoint_response.g.dart';

@JsonSerializable()
class DoctorAppointmentResponse {
  @JsonKey(name: 'doctor_appointments')
  final List<DoctorAppointment> docAppointment;

  DoctorAppointmentResponse({this.docAppointment});

  factory DoctorAppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorAppointmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorAppointmentResponseToJson(this);
}
