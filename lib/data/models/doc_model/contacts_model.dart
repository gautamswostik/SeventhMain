import 'package:json_annotation/json_annotation.dart';
import 'package:seventh_main/data/models/doc_model/social_model.dart';
part 'contacts_model.g.dart';

@JsonSerializable()
class Contacts{
  final String email;
  final String phone;
  final Social social;

  Contacts({
    this.email,
    this.phone,
    this.social,
  });

  factory Contacts.fromJson(Map<String, dynamic> json) => _$ContactsFromJson(json);

  Map<String, dynamic> toJson() => _$ContactsToJson(this);
}
