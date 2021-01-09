part of 'hospital_appointment_bloc.dart';

abstract class HospitalAppointmentEvent extends Equatable {
  const HospitalAppointmentEvent();

  @override
  List<Object> get props => [];
}

class HospitalAppointmentLoadEvent extends HospitalAppointmentEvent {}
