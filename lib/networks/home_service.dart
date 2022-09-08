import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/common/api_key.dart';
import 'package:untitled/models/json_annotation.dart';

class HomeService {
  static Future<OneCallAPIWeather> fetchWeather(
      num lat, num lon, String units) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&appid=${ApiKey.keyAPI}&units=$units'));

    if (response.statusCode == 200) {
      OneCallAPIWeather data =
          OneCallAPIWeather.fromJson(jsonDecode(response.body));
      return data;
    } else {
      return throw Exception('Failed to load API');
    }
  }
}
