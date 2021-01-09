import 'package:json_annotation/json_annotation.dart';
part 'socials.g.dart';

@JsonSerializable()
class SocialHos {
  final String facebook;
  final String instagram;

  SocialHos({
    this.facebook,
    this.instagram,
  });

  factory SocialHos.fromJson(Map<String, dynamic> json) =>
      _$SocialHosFromJson(json);

  Map<String, dynamic> toJson() => _$SocialHosToJson(this);
}
