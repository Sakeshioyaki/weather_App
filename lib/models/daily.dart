import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/models/feels_like.dart';
import 'package:untitled/models/temp.dart';
import 'package:untitled/models/weather.dart';

part 'daily.g.dart';

@JsonSerializable()
class Daily {
  num? dt;
  num? sunrise;
  num? sunset;
  num? moonrise;
  num? moonset;
  @JsonKey(name: 'moon_phase')
  num? moonPhase;
  Temp? temp;
  @JsonKey(name: 'feels_like')
  FeelsLike? feelsLike;
  num? pressure;
  num? humidity;
  @JsonKey(name: 'dew_point')
  num? dewPoint;
  @JsonKey(name: 'wind_speed')
  num? windSpeed;
  @JsonKey(name: 'wind_deg')
  num? windDeg;
  @JsonKey(name: 'wind_gust')
  num? windGust;
  List<Weather>? weather;
  num? clouds;
  num? pop;
  num? uvi;
  num? rain;

  Daily(
      {this.dt,
      this.sunrise,
      this.sunset,
      this.moonrise,
      this.moonset,
      this.moonPhase,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.windSpeed,
      this.windDeg,
      this.windGust,
      this.weather,
      this.clouds,
      this.pop,
      this.uvi,
      this.rain});

  /// factory.
  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);

  /// Connect the generated .. function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DailyToJson(this);
}
