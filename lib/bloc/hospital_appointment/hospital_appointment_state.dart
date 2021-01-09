part of 'hospital_appointment_bloc.dart';

abstract class HospitalAppointmentState extends Equatable {
  const HospitalAppointmentState();

  @override
  List<Object> get props => [];
}

class HospitalAppointmentInitial extends HospitalAppointmentState {}

class HospitalAppointmentLoaded extends HospitalAppointmentState {
  final List<HospitalAppointmentEntity> hosAppointment;

  HospitalAppointmentLoaded({this.hosAppointment});

  @override
  List<Object> get props => [hosAppointment];
}

class HospitalAppointmentError extends HospitalAppointmentState {
  final String errorMessage;

  HospitalAppointmentError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
