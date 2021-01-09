import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class DoctorAppointmentEntity extends Equatable {
  final String id;
  final String forDoctor;
  final String fullName;
  final String email;
  final int contact;
  final String problemDescription;
  final String date;

  DoctorAppointmentEntity({
    @required this.id,
    @required this.forDoctor,
    @required this.fullName,
    @required this.email,
    @required this.contact,
    @required this.problemDescription,
    @required this.date,
  });

  @override
  List<Object> get props => [id, contact];

  @override
  bool get stringify => true;
}
