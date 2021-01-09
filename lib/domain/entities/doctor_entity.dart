import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:seventh_main/data/models/doc_model/contacts_model.dart';

class DoctorEntity extends Equatable {
  final String id;
  final String name;
  final String type;
  final Contacts contacts;
  final String working;
  final String description;

  DoctorEntity({
    @required this.id,
    @required this.name,
    @required this.type,
    @required this.contacts,
    @required this.working,
    @required this.description,
  }) : assert(id != null, 'id cannpt be null');

  @override
  List<Object> get props => [id, name, description];

  @override
  bool get stringify => true;
}
