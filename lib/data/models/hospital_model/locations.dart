import 'package:json_annotation/json_annotation.dart';
part 'locations.g.dart';

@JsonSerializable()
class Locations {
  final String country;
  final String city;
  @JsonKey(name: 'sub_city')
  final String subCity;

  Locations({
    this.country,
    this.city,
    this.subCity,
  });

  factory Locations.fromJson(Map<String, dynamic> json) =>
      _$LocationsFromJson(json);

  Map<String, dynamic> toJson() => _$LocationsToJson(this);
}
