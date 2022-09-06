import 'package:cleat_architecture_weather_app/core/utils/app_strings.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/data/models/weather_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_datasource.g.dart';

@RestApi(baseUrl: AppStrings.baseUrl)
abstract class BaseWeatherRemoteDatasource {
  factory BaseWeatherRemoteDatasource(Dio dio, {String baseUrl}) = _BaseWeatherRemoteDatasource;

  @GET("appid=${AppStrings.apiKey}&units=metric")
  Future<WeatherModel> getWeatherData(
    @Query('lat') String lat,
    @Query('lon') String lon,
  );
}
