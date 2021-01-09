import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:seventh_main/data/models/hospital_model/contacts.dart';
import 'package:seventh_main/data/models/hospital_model/locations.dart';
import 'package:seventh_main/data/models/hospital_model/services.dart';

class HospitalEntity extends Equatable {
  final String id;
  final String name;
  final Services services;
  final ContactsHos contacts;
  final Locations locations;
  final String description;

  HospitalEntity({
    @required this.id,
    @required this.name,
    @required this.services,
    @required this.contacts,
    @required this.locations,
    @required this.description,
  }) : assert(id != null, 'Id cannot be null');

  @override
  List<Object> get props => [id, name, locations.city];

  @override
  bool get stringify => true;
}
