import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class HospitalAppointmentEntity extends Equatable {
  final String id;
  final String forHospital;
  final String fullName;
  final String email;
  final String contact;
  final String problemCatagory;
  final String problemDescription;
  final String date;

  HospitalAppointmentEntity({
    @required this.id,
    @required this.forHospital,
    @required this.fullName,
    @required this.email,
    @required this.contact,
    @required this.problemCatagory,
    @required this.problemDescription,
    @required this.date,
  });

  @override
  List<Object> get props => [id, forHospital];

  @override
  bool get stringify => true;
}
