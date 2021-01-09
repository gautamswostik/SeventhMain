import 'package:dartz/dartz.dart';
import 'package:seventh_main/data/models/doc_model/doctor_model.dart';
import 'package:seventh_main/data/models/hospital_model/hospitals.dart';
import 'package:seventh_main/data/network/remote_data_source.dart';
import 'package:seventh_main/domain/entities/app_error.dart';
import 'package:seventh_main/domain/repository/api_repository.dart';
import 'package:seventh_main/data/models/doctor_appointment_model/doc_appointment.dart';
import 'package:seventh_main/data/models/hospital_appointment/hospital_appoitment.dart';

class ApiRepositoryImpl extends ApiRepository {
  final RemoteDataSource remoteDataSource;

  ApiRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, List<Doctors>>> getDoctors() async {
    try {
      final doctors = await remoteDataSource.getDoctors();
      return Right(doctors);
    } on Exception {
      return Left(AppError('message'));
    }
  }

  @override
  Future<Either<AppError, List<Hospitals>>> getHospitals() async {
    try {
      final hospitals = await remoteDataSource.getHospitals();
      return Right(hospitals);
    } on Exception {
      return Left(AppError('error message'));
    }
  }

  @override
  Future<Either<AppError, List<DoctorAppointment>>>
      getDoctorAppointment() async {
    try {
      final doctorAppointment = await remoteDataSource.getDoctorAppointments();
      return Right(doctorAppointment);
    } on Exception {
      return Left(AppError('error message'));
    }
  }

  @override
  Future<Either<AppError, List<HospitalAppointment>>>
      getHospitalAppointment() async {
    try {
      final hospitalAppointment =
          await remoteDataSource.getHospitalAppointment();
      return Right(hospitalAppointment);
    } on Exception {
      return Left(AppError('error message'));
    }
  }
}
