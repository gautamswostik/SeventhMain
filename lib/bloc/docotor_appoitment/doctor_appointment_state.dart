part of 'doctor_appointment_bloc.dart';

abstract class DoctorAppointmentState extends Equatable {
  const DoctorAppointmentState();

  @override
  List<Object> get props => [];
}

class DoctorAppointmentInitial extends DoctorAppointmentState {}

class DoctorAppointmentLoaded extends DoctorAppointmentState {
  final List<DoctorAppointmentEntity> doctorAppointment;

  DoctorAppointmentLoaded({this.doctorAppointment});

  @override
  List<Object> get props => [doctorAppointment];
}

class DoctorAppointmentError extends DoctorAppointmentState {
  final String errorMessage;

  DoctorAppointmentError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
