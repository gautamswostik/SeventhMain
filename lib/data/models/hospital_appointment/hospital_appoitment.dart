import 'package:json_annotation/json_annotation.dart';
import 'package:seventh_main/domain/entities/hos_appointment_entity.dart';

part 'hospital_appoitment.g.dart';

@JsonSerializable()
class HospitalAppointment extends HospitalAppointmentEntity {
  @JsonKey(name: '_id')
  final String id;
  final String forHos;
  final String fullName;
  final String email;
  final String contact;
  final String problemCatagory;
  final String problemDescription;
  final String date;

  HospitalAppointment({
    this.id,
    this.forHos,
    this.fullName,
    this.email,
    this.contact,
    this.problemCatagory,
    this.problemDescription,
    this.date,
  }) : super(
          id: id,
          forHospital: forHos,
          fullName: fullName,
          email: email,
          contact: contact,
          problemCatagory: problemCatagory,
          problemDescription: problemDescription,
          date: date,
        );

  factory HospitalAppointment.fromJson(Map<String, dynamic> json) =>
      _$HospitalAppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$HospitalAppointmentToJson(this);
}
