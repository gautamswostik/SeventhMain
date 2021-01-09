part of 'hospitals_bloc.dart';

abstract class HospitalsState extends Equatable {
  const HospitalsState();

  @override
  List<Object> get props => [];
}

class HospitalsInitial extends HospitalsState {}

class HospitalLoadedState extends HospitalsState {
  final List<HospitalEntity> hospitals;

  HospitalLoadedState({this.hospitals});

  @override
  List<Object> get props => [hospitals];
}

class HospitalErrorState extends HospitalsState {
  final String errorMessage;

  HospitalErrorState({this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
