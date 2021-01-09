import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:seventh_main/domain/entities/doc_appointment_entity.dart';
import 'package:seventh_main/domain/entities/no_params.dart';
import 'package:seventh_main/domain/usecases/get_docotor_appointment.dart';

part 'doctor_appointment_event.dart';
part 'doctor_appointment_state.dart';

class DoctorAppointmentBloc
    extends Bloc<DoctorAppointmentEvent, DoctorAppointmentState> {
  final GetDoctorAppointment doctorAppointment;

  DoctorAppointmentBloc({
    @required this.doctorAppointment,
  }) : super(DoctorAppointmentInitial());

  @override
  Stream<DoctorAppointmentState> mapEventToState(
    DoctorAppointmentEvent event,
  ) async* {
    if (event is DoctorAppontmentLoadEvent) {
      final docAppointmetEither = await doctorAppointment(NoParams());
      yield docAppointmetEither.fold((l) => DoctorAppointmentError(),
          (docAppointments) {
        return DoctorAppointmentLoaded(doctorAppointment: docAppointments);
      });
    }
  }
}
