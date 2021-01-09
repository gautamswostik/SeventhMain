import 'package:json_annotation/json_annotation.dart';
import 'package:seventh_main/data/models/doc_model/doctor_model.dart';

part 'doctor_response.g.dart';

@JsonSerializable()
class DoctorResponse{
  final List<Doctors> doctors;

  DoctorResponse(this.doctors);
  
  factory DoctorResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorResponseToJson(this);
}