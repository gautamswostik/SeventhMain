import 'package:dartz/dartz.dart';
import 'package:seventh_main/domain/entities/app_error.dart';
import 'package:seventh_main/domain/entities/doc_appointment_entity.dart';
import 'package:seventh_main/domain/entities/doctor_entity.dart';
import 'package:seventh_main/domain/entities/hos_appointment_entity.dart';
import 'package:seventh_main/domain/entities/hospital_entities.dart';

abstract class ApiRepository {
  Future<Either<AppError, List<DoctorEntity>>> getDoctors();
  Future<Either<AppError, List<HospitalEntity>>> getHospitals();
  Future<Either<AppError , List<DoctorAppointmentEntity>>> getDoctorAppointment();
  Future<Either<AppError , List<HospitalAppointmentEntity>>> getHospitalAppointment();
}
