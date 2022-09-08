import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:untitled/models/json_annotation.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://api.openweathermap.org")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  /// weather
  @GET("data/onecall")
  Future<OneCallAPIWeather> getOneCallAPIWeather(
      @Query('lat') num lat, @Query('lon') num lon,
      {@Query('appid') String? appid,
      @Query('units') String? units,
      @Query('lang') String? lang,
      @Query('exclude') String? exclude});
}
