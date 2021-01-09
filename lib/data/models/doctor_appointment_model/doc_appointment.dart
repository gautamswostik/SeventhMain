import 'package:json_annotation/json_annotation.dart';
import 'package:seventh_main/domain/entities/doc_appointment_entity.dart';

part 'doc_appointment.g.dart';

@JsonSerializable()
class DoctorAppointment extends DoctorAppointmentEntity {
  @JsonKey(name: '_id')
  final String id;
  final String forDoc;
  final String fullName;
  final String email;
  final int contact;
  final String problemDescription;
  final date;

  DoctorAppointment({
    this.id,
    this.forDoc,
    this.fullName,
    this.email,
    this.contact,
    this.problemDescription,
    this.date,
  }) : super(
          id: id,
          forDoctor: forDoc,
          fullName: fullName,
          email: email,
          contact: contact,
          problemDescription: problemDescription,
          date: date,
        );

  factory DoctorAppointment.fromJson(Map<String, dynamic> json) =>
      _$DoctorAppointmentFromJson(json);

  Map<String, dynamic> tojson() => _$DoctorAppointmentToJson(this);
}
