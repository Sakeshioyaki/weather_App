part 'json_annotation.g.dart';

@JsonSerializable()
class OneCallAPIWeather {
  /// The generated code assumes these values exist in JSON.
  final String firstName, lastName;
  final num? lat;
  final num? lon;
  final String? timezone;
  final num? timezoneOffset;
  final Current? current;
  final List<Hourly>? hourly;
  final List<Daily>? daily;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.
  final DateTime? dateOfBirth;

  OneCallAPIWeather(
      {required this.firstName, required this.lastName, this.dateOfBirth});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
