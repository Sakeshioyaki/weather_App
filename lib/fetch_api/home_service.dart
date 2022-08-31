import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/common/api_key.dart';
import 'package:untitled/models/current_weather.dart';
import 'package:untitled/models/day_weather.dart';

class HomeService {
  static Future<Map<String, dynamic>> fetchWeather(
      num lat, num lon, String units) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&appid=${Key.keyAPI}&units=$units'));

    if (response.statusCode == 200) {
      CurrentWeather data =
          CurrentWeather.fromJson(jsonDecode(response.body)['current']);
      List<DayWeather> dayData = [];
      jsonDecode(response.body)['hourly']
          .map((e) => {dayData.add(DayWeather.fromJson(e))});
      Map<String, dynamic> mapWeather = {
        'data': data,
        'dayData': dayData,
      };
      return mapWeather;
    } else {
      return throw Exception('Failed to load API');
    }
  }

  static Future<CurrentWeather> fetchWeatherData(
      num lat, num lon, String units) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&appid=${Key.keyAPI}&units=$units'));

    if (response.statusCode == 200) {
      CurrentWeather data =
          CurrentWeather.fromJson(jsonDecode(response.body)['current']);
      List<DayWeather> dayData = [];
      jsonDecode(response.body)['hourly']
          .map((e) => {dayData.add(DayWeather.fromJson(e))});

      return data;
    } else {
      return throw Exception('Failed to load API');
    }
  }
}
