import 'package:json_annotation/json_annotation.dart';

part 'service_types.g.dart';

@JsonSerializable()
class ServiceTypes {
  final String type1;
  final String type2;

  ServiceTypes({
    this.type1,
    this.type2,
  });

  factory ServiceTypes.fromJson(Map<String, dynamic> json) =>
      _$ServiceTypesFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceTypesToJson(this);
}
