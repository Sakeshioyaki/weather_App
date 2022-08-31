import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/common/api_key.dart';
import 'package:untitled/models/current_weather.dart';

class HomeService {
  static Future<CurrentWeather?> fetchCurrentWeather(num lat, num lon) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&appid=${Key.keyAPI}'));

    if (response.statusCode == 200) {
      CurrentWeather data =
          CurrentWeather.fromJson(jsonDecode(response.body)['current']);

      return data;
    } else {
      return null;
    }
  }
}
