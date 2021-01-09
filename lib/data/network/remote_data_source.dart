import 'package:seventh_main/data/core/api_client.dart';
import 'package:seventh_main/data/core/urls.dart';
import 'package:seventh_main/data/models/doc_model/doctor_model.dart';
import 'package:seventh_main/data/models/doc_model/doctor_response.dart';
import 'package:seventh_main/data/models/hospital_model/hospital_response.dart';
import 'package:seventh_main/data/models/hospital_model/hospitals.dart';
import 'package:seventh_main/data/models/doctor_appointment_model/doc_appointment.dart';
import 'package:seventh_main/data/models/hospital_appointment/hospital_appoitment.dart';
import 'package:seventh_main/data/models/doctor_appointment_model/doc_apoint_response.dart';
import 'package:seventh_main/data/models/hospital_appointment/hos_apoint_response.dart';

abstract class RemoteDataSource {
  Future<List<Doctors>> getDoctors();
  Future<List<Hospitals>> getHospitals();
  Future<List<DoctorAppointment>> getDoctorAppointments();
  Future<List<HospitalAppointment>> getHospitalAppointment();
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final ApiClient _client;

  RemoteDataSourceImpl(this._client);

  @override
  Future<List<Doctors>> getDoctors() async {
    final response = await _client.get(doctorsEndpoint);
    final doctors = DoctorResponse.fromJson(response).doctors;
    print(doctors);
    return (doctors);
  }

  @override
  Future<List<Hospitals>> getHospitals() async {
    final response = await _client.get(hopitalEndpoint);
    final hospitals = HospitalResponse.fromJson(response).hospitals;
    print(hospitals);
    return (hospitals);
  }

  @override
  Future<List<DoctorAppointment>> getDoctorAppointments() async {
    final response = await _client.get(doctorAppointmentEndpoint);
    final docAppointments =
        DoctorAppointmentResponse.fromJson(response).docAppointment;
    print(docAppointments);
    return (docAppointments);
  }

  @override
  Future<List<HospitalAppointment>> getHospitalAppointment() async {
    final response = await _client.get(hospitalAppointmenrEndpoint);
    final hospitalAppintment =
        HospitalAppointmentRespose.fromJson(response).hosResponse;
    print(hospitalAppintment);
    return (hospitalAppintment);
  }
}
