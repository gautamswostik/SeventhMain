import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:seventh_main/bloc/docotor_appoitment/doctor_appointment_bloc.dart';
import 'package:seventh_main/bloc/doctors_bloc/doctors_bloc.dart';
import 'package:seventh_main/bloc/hospital_appointment/hospital_appointment_bloc.dart';
import 'package:seventh_main/bloc/hospital_bloc/hospitals_bloc.dart';
import 'package:seventh_main/data/core/api_client.dart';
import 'package:seventh_main/data/network/remote_data_source.dart';
import 'package:seventh_main/data/repository/api_repository_imple.dart';
import 'package:seventh_main/domain/repository/api_repository.dart';
import 'package:seventh_main/domain/usecases/get_docotor_appointment.dart';
import 'package:seventh_main/domain/usecases/get_doctors.dart';
import 'package:seventh_main/domain/usecases/get_hospital_apointment.dart';
import 'package:seventh_main/domain/usecases/get_hospitals.dart';

final GetIt inject = GetIt.instance;

Future init() async {
  inject.registerLazySingleton<Client>(() => Client());

  inject.registerLazySingleton<ApiClient>(() => ApiClient(inject()));

  inject.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(inject()));

  inject.registerLazySingleton<GetDoctors>(() => GetDoctors(inject()));

  inject.registerLazySingleton<GetHospital>(() => GetHospital(inject()));

  inject.registerLazySingleton<GetDoctorAppointment>(
      () => GetDoctorAppointment(inject()));

  inject.registerLazySingleton<GetHospitalAppointments>(
      () => GetHospitalAppointments(inject()));

  inject.registerLazySingleton<ApiRepository>(
    () => ApiRepositoryImpl(
      inject(),
    ),
  );

  inject.registerFactory(() => DoctorsBloc(getDoctors: inject()));

  inject.registerFactory(() => HospitalsBloc(getHospital: inject()));

  inject.registerFactory(
      () => DoctorAppointmentBloc(doctorAppointment: inject()));

  inject.registerFactory(
      () => HospitalAppointmentBloc(getHospitalAppointments: inject()));
}
