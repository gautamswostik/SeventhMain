import 'package:json_annotation/json_annotation.dart';
part 'social_model.g.dart';

@JsonSerializable()
class Social {
  final String facebook;
  final String instagram;

  Social({
    this.facebook,
    this.instagram,
  });

  factory Social.fromJson(Map<String, dynamic> json) => _$SocialFromJson(json);

  Map<String, dynamic> toJson() => _$SocialToJson(this);
}
