class CurrentWeather {
  num? temp;
  num? feelsLike;
  num? pressure;
  num? humidity;
  num? dewPoint;
  num? uvi;
  num? clouds;
  num? visibility;
  num? windSpeed;
  num? windDeg;
  num? windGust;
  List<Weather>? weather;

  CurrentWeather(
      {this.temp,
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
      this.weather});

  CurrentWeather.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    dewPoint = json['dew_point'];
    uvi = json['uvi'];
    clouds = json['clouds'];
    visibility = json['visibility'];
    windSpeed = json['wind_speed'];
    windDeg = json['wind_deg'];
    windGust = json['wind_gust'];
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['temp'] = temp;
  //   data['feels_like'] = feelsLike;
  //   data['pressure'] = pressure;
  //   data['humidity'] = humidity;
  //   data['dew_point'] = dewPoint;
  //   data['uvi'] = uvi;
  //   data['clouds'] = clouds;
  //   data['visibility'] = visibility;
  //   data['wind_speed'] = windSpeed;
  //   data['wind_deg'] = windDeg;
  //   data['wind_gust'] = windGust;
  //   if (weather != null) {
  //     data['weather'] = weather!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['main'] = main;
  //   data['description'] = description;
  //   data['icon'] = icon;
  //   return data;
  // }
}
