import 'package:json_annotation/json_annotation.dart';
import 'package:seventh_main/data/models/hospital_model/socials.dart';

part 'contacts.g.dart';

@JsonSerializable()
class ContactsHos{
  final String email;
  final String phone;
  final SocialHos social;

  ContactsHos({
    this.email,
    this.phone,
    this.social,
  });

  factory ContactsHos.fromJson(Map<String, dynamic> json) => _$ContactsHosFromJson(json);

  Map<String, dynamic> toJson() => _$ContactsHosToJson(this);
}
