import 'package:freezed_annotation/freezed_annotation.dart';

import 'current.dart';
import 'hourly.dart';

part 'json_annotation.g.dart';

@JsonSerializable()
class OneCallAPIWeather {
  /// The generated code assumes these values exist in JSON.
  final num? lat;
  final num? lon;
  final String? timezone;
  @JsonKey(name: 'timezone_offset')
  final num? timezoneOffset;
  final Current? current;
  final List<Hourly>? hourly;
  final List<Daily>? daily;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.

  OneCallAPIWeather({
    required this.lat,
    required this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.hourly,
    this.daily,
  });

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory OneCallAPIWeather.fromJson(Map<String, dynamic> json) =>
      _$OneCallAPIWeatherFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$OneCallAPIWeatherFromJson(this);
}
