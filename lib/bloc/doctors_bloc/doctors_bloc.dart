import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:seventh_main/domain/entities/doctor_entity.dart';
import 'package:seventh_main/domain/entities/no_params.dart';
import 'package:seventh_main/domain/usecases/get_doctors.dart';

part 'doctors_event.dart';
part 'doctors_state.dart';

class DoctorsBloc extends Bloc<DoctorsEvent, DoctorsState> {
  final GetDoctors getDoctors;
  DoctorsBloc({
    @required this.getDoctors,
  }) : super(DoctorsInitial());

  @override
  Stream<DoctorsState> mapEventToState(
    DoctorsEvent event,
  ) async* {
    if (event is DoctorLoadEvent) {
      final doctorsEither = await getDoctors(NoParams());
      yield doctorsEither.fold((l) => DoctorErrorState(), (doctors) {
        return DoctorLoaded(
          doctors: doctors,
        );
      });
    }
  }
}
