import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class FeelsLike {
  num? day;
  num? night;
  num? eve;
  num? morn;

  FeelsLike({this.day, this.night, this.eve, this.morn});

  /// factory.
  factory FeelsLike.fromJson(Map<String, dynamic> json) =>
      _$FeelsLikeFromJson(json);

  /// Connect the generated .. function to the `toJson` method.
  Map<String, dynamic> toJson() => _$FeelsLikeFromJson(this);
}
