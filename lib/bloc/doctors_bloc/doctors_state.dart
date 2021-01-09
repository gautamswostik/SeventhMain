part of 'doctors_bloc.dart';

abstract class DoctorsState extends Equatable {
  const DoctorsState();

  @override
  List<Object> get props => [];
}

class DoctorsInitial extends DoctorsState {}

class DoctorLoaded extends DoctorsState {
  final List<DoctorEntity> doctors;

  DoctorLoaded({this.doctors});

  @override
  List<Object> get props => [doctors];
}

class DoctorErrorState extends DoctorsState {
  final String message;

  DoctorErrorState({this.message});

  @override
  List<Object> get props => [message];
}
