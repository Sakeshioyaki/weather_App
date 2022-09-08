import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/models/weather.dart';

part 'hourly.g.dart';

@JsonSerializable()
class Hourly {
  final num? dt;
  final num? temp;
  final num? feelsLike;
  final num? pressure;
  final num? humidity;
  @JsonKey(name: 'dew_point')
  final num? dewPoint;
  final num? uvi;
  final num? clouds;
  final num? visibility;
  @JsonKey(name: 'wind_speed')
  final num? windSpeed;
  @JsonKey(name: 'wind_deg')
  final num? windDeg;
  @JsonKey(name: 'wind_gust')
  final num? windGust;
  final List<Weather>? weather;
  final num? pop;

  Hourly(
      {this.dt,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.uvi,
      this.clouds,
      this.visibility,
      this.windSpeed,
      this.windDeg,
      this.windGust,
      this.weather,
      this.pop});
  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$HourlyToJson(this);
}
