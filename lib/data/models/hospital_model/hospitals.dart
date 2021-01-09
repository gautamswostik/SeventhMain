import 'package:json_annotation/json_annotation.dart';
import 'package:seventh_main/data/models/hospital_model/contacts.dart';
import 'package:seventh_main/data/models/hospital_model/locations.dart';
import 'package:seventh_main/data/models/hospital_model/services.dart';
import 'package:seventh_main/domain/entities/hospital_entities.dart';

part 'hospitals.g.dart';

@JsonSerializable()
class Hospitals extends HospitalEntity {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final Services services;
  @JsonKey(name: 'contacts')
  final ContactsHos contactsHos;
  final Locations locations;
  final String description;

  Hospitals({
    this.id,
    this.name,
    this.services,
    this.contactsHos,
    this.locations,
    this.description,
  }) : super(
            id: id,
            name: name,
            services: services,
            contacts: contactsHos,
            locations: locations,
            description: description);

  factory Hospitals.fromJson(Map<String, dynamic> json) =>
      _$HospitalsFromJson(json);

  Map<String, dynamic> toJson() => _$HospitalsToJson(this);
}
