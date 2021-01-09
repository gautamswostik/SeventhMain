import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:seventh_main/domain/entities/hospital_entities.dart';
import 'package:seventh_main/domain/entities/no_params.dart';
import 'package:seventh_main/domain/usecases/get_hospitals.dart';

part 'hospitals_event.dart';
part 'hospitals_state.dart';

class HospitalsBloc extends Bloc<HospitalsEvent, HospitalsState> {
  final GetHospital getHospital;

  HospitalsBloc({
    @required this.getHospital,
  }) : super(HospitalsInitial());

  @override
  Stream<HospitalsState> mapEventToState(
    HospitalsEvent event,
  ) async* {
    if (event is HospitalLoadEvent) {
      final hospitalEither = await getHospital(NoParams());
      yield hospitalEither.fold(
        (l) => HospitalErrorState(),
        (hospitals) => HospitalLoadedState(
          hospitals: hospitals,
        ),
      );
    }
  }
}
