import 'package:cleat_architecture_weather_app/core/errors/errors.dart';
import 'package:cleat_architecture_weather_app/core/errors/exceptions.dart';
import 'package:cleat_architecture_weather_app/core/network/network_info.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/data/data_sources/local_datasource.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/data/data_sources/remote_datasource.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/data/models/weather_model.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/domain/entities/weather.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/domain/repositories/base_weather_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class WeatherRepository extends BaseWeatherRepository {
  final NetworkInfo networkInfo = NetworkInfoImpl(connectionChecker: InternetConnectionChecker());
  final BaseWeatherRemoteDatasource weatherRemoteDatasource;
  final BaseWeatherLocalDatabase weatherLocalDatabase;

  WeatherRepository({
    required this.weatherRemoteDatasource,
    required this.weatherLocalDatabase,
  });

  @override
  Future<Either<Failure, Weather>> getWeather(double latitude, double longitude) async {
    if (await networkInfo.isConnected) {
      try {
        final WeatherModel remoteWeatherData =
            await weatherRemoteDatasource.getWeatherData(latitude.toString(), longitude.toString());
        weatherLocalDatabase.cacheWeatherData(remoteWeatherData);
        return Right(remoteWeatherData);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final cacheRandomQuote = await weatherLocalDatabase.getLastWeatherData();
        return Right(cacheRandomQuote);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }
}
