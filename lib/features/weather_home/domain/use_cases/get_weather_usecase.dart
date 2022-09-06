import 'package:cleat_architecture_weather_app/core/errors/errors.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/domain/entities/weather.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/domain/repositories/base_weather_repository.dart';
import 'package:dartz/dartz.dart';

class GetWeatherUseCase {
  final BaseWeatherRepository repository;

  GetWeatherUseCase(this.repository);

  Future<Either<Failure, Weather>> call(double latitude, double longitude) async {
    return await repository.getWeather(latitude, longitude);
  }
}
