import 'package:cleat_architecture_weather_app/core/errors/errors.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/domain/entities/weather.dart';
import 'package:dartz/dartz.dart';

abstract class BaseWeatherRepository {
  Future<Either<Failure, Weather>> getWeather(double latitude, double longitude);
}
