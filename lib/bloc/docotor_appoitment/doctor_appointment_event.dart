part of 'doctor_appointment_bloc.dart';

abstract class DoctorAppointmentEvent extends Equatable {
  const DoctorAppointmentEvent();

  @override
  List<Object> get props => [];
}

class DoctorAppontmentLoadEvent extends DoctorAppointmentEvent {}
