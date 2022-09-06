import 'package:cleat_architecture_weather_app/core/utils/helper.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required super.currentTemp,
    required super.feelsLike,
    required super.dates,
    required super.temps,
    required super.sunrise,
    required super.sunset,
    required super.windSpeed,
    required super.humidityPercentage,
    required super.icons,
    required super.location,
  });

  Map<String, dynamic> toMap() {
    return {
      'currentTemp': currentTemp,
      'feelsLike': feelsLike,
      'dates': dates,
      'temps': temps,
      'sunrise': sunrise,
      'sunset': sunset,
      'windSpeed': windSpeed,
      'humidityPercentage': humidityPercentage,
      'location': location,
      'icon': icons
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
        currentTemp: map['currentTemp'],
        feelsLike: map['currentTemp'],
        dates: map['dates'],
        temps: map['temps'],
        sunrise: map['sunrise'],
        sunset: map['sunset'],
        windSpeed: map['windSpeed'],
        humidityPercentage: map['humidityPercentage'],
        icons: map['icons'],
        location: map['location']);
  }

  factory WeatherModel.fromJson(Map<String, dynamic> map) {
    List<DateTime> dates = [];
    List<int> temps = [];
    List<String> icons = [];
    for (var weatherJson in map['list']) {
      dates.add(Helper.convertTimestampToDateTime(weatherJson['dt']));
      temps.add(weatherJson['main']['temp'].toInt());
      icons.add(weatherJson['weather'][0]['icon'] as String);
    }
    return WeatherModel(
        currentTemp: (map['list'][0]['main']['temp'] as double).toInt(),
        feelsLike: (map['list'][0]['main']['feels_like'] as double).toInt(),
        dates: dates,
        temps: temps,
        sunrise: Helper.convertTimestampToDateTime(map['city']['sunrise']),
        sunset: Helper.convertTimestampToDateTime(map['city']['sunset']),
        windSpeed: (map['list'][0]['wind']['speed'] as double).toInt(),
        humidityPercentage: map['list'][0]['main']['humidity'] as int,
        icons: icons,
        location: map['city']['name'] as String);
  }

  List<DateTime> _getDatesList(Map<String, dynamic> map) {
    List<DateTime> dates = [];
    for (var weatherJson in map['list']) {
      dates.add(Helper.convertTimestampToDateTime(weatherJson['dt']));
    }
    return dates;
  }

  List<int> _getTempList(Map<String, dynamic> map) {
    List<int> temps = [];
    for (var weatherJson in map['list']) {
      temps.add(map['main']['temp']);
    }
    return temps;
  }
}
