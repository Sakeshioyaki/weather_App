import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:untitled/models/json_annotation.dart';

@RestApi(baseUrl: "https://api.openweathermap.org/data/2.5/onecall?")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  /// weather
  @GET("/https://api.openweathermap.org/data/2.5/onecall")
  Future<OneCallAPIWeather> getOneCallAPIWeather(
    //************************************
    // Description: 	Geographical coordinates (latitude, longitude)
    //************************************
    @Query('lat') num lat,
    @Query('lon') num lon,
    @Query('appid') num appid,

    //************************************
    // Description: Units of measurement. standard, metric and imperial units are available. If you do not use the units parameter, standard units will be applied by default.
    // Learn more : https://openweathermap.org/api/one-call-3#data
    //************************************
    @Query('units') num units,

    //************************************
    // Description: You can use the lang parameter to get the output in your language.
    // Learn more : https://openweathermap.org/api/one-call-3#multi
    //************************************
    @Query('lang') num lang,

    //************************************
    // Description: By using this parameter you can exclude some parts of the weather data from the API response. It should be a comma-delimited list (without spaces).
    //  * current
    //  * minutely
    //  * hourly
    //  * daily
    //  * alerts
    //************************************
    @Query('exclude') num exclude,
  );
}
