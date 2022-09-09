import 'package:untitled/models/json_annotation.dart';
import 'package:untitled/networks/api_client.dart';

abstract class WeatherRepository {
  Future<OneCallAPIWeather> getWeather({
    required num lat,
    required num lon,
  });
}

class WeatherRepositoryImpl extends WeatherRepository {
  ApiClient apiClient;

  WeatherRepositoryImpl({required this.apiClient});

  @override
  Future<OneCallAPIWeather> getWeather({required num lat, required num lon}) {
    return apiClient.getOneCallAPIWeather(lat, lon);
  }
}
