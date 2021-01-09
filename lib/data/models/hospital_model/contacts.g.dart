// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactsHos _$ContactsHosFromJson(Map<String, dynamic> json) {
  return ContactsHos(
    email: json['email'] as String,
    phone: json['phone'] as String,
    social: json['social'] == null
        ? null
        : SocialHos.fromJson(json['social'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ContactsHosToJson(ContactsHos instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
      'social': instance.social,
    };
