import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:seventh_main/domain/entities/hos_appointment_entity.dart';
import 'package:seventh_main/domain/entities/no_params.dart';
import 'package:seventh_main/domain/usecases/get_hospital_apointment.dart';

part 'hospital_appointment_event.dart';
part 'hospital_appointment_state.dart';

class HospitalAppointmentBloc
    extends Bloc<HospitalAppointmentEvent, HospitalAppointmentState> {
  final GetHospitalAppointments getHospitalAppointments;

  HospitalAppointmentBloc({
    @required this.getHospitalAppointments,
  }) : super(HospitalAppointmentInitial());

  @override
  Stream<HospitalAppointmentState> mapEventToState(
    HospitalAppointmentEvent event,
  ) async* {
    if (event is HospitalAppointmentLoadEvent) {
      final hospitalAppointEither = await getHospitalAppointments(NoParams());
      yield hospitalAppointEither.fold((l) => HospitalAppointmentError(),
          (hospitalAppointments) {
        return HospitalAppointmentLoaded(
          hosAppointment: hospitalAppointments,
        );
      });
    }
  }
}
