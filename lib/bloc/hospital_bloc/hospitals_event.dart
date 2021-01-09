part of 'hospitals_bloc.dart';

abstract class HospitalsEvent extends Equatable {
  const HospitalsEvent();

  @override
  List<Object> get props => [];
}

class HospitalLoadEvent extends HospitalsEvent {}
