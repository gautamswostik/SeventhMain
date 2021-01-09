import 'package:json_annotation/json_annotation.dart';
import 'package:seventh_main/data/models/doc_model/contacts_model.dart';
import 'package:seventh_main/domain/entities/doctor_entity.dart';

part 'doctor_model.g.dart';

@JsonSerializable()
class Doctors extends DoctorEntity {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String type;
  final Contacts contacts;
  final String working;
  final String description;

  Doctors({
    this.id,
    this.name,
    this.type,
    this.contacts,
    this.working,
    this.description,
  }) : super(
          id: id,
          name: name,
          type: type,
          contacts: contacts,
          working: working,
          description: description,
        );

  factory Doctors.fromJson(Map<String, dynamic> json) =>
      _$DoctorsFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorsToJson(this);
}
