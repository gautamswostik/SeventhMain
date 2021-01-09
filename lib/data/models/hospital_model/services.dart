import 'package:json_annotation/json_annotation.dart';
import 'service_types.dart';
part 'services.g.dart';

@JsonSerializable()
class Services {
  final String time;
  final ServiceTypes types;

  Services({
    this.time,
    this.types,
  });

  factory Services.fromJson(Map<String, dynamic> json) =>
      _$ServicesFromJson(json);

  Map<String, dynamic> toJson() => _$ServicesToJson(this);
}
