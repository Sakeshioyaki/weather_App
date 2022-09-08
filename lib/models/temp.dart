import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class Temp {
  num? day;
  num? min;
  num? max;
  num? night;
  num? eve;
  num? morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  /// factory.
  factory Temp.fromJson(Map<String, dynamic> json) => _$TempFromJson(json);

  /// Connect the generated .. function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TempFromJson(this);
}
