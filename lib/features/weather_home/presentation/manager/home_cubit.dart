import 'package:cleat_architecture_weather_app/core/errors/errors.dart';
import 'package:cleat_architecture_weather_app/core/location/location_service.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/data/data_sources/local_datasource.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/data/data_sources/remote_datasource.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/data/repositories/weather_repository.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/domain/entities/weather.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/domain/repositories/base_weather_repository.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/domain/use_cases/get_weather_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  String? locationName;

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  Future<LocationData?> _getLocation() async {
    final service = LocationService();
    final locationData = await service.getLocation();

    return locationData;
  }

  void getWeatherData() async {
    emit(HomeLoading());
    final service = LocationService();
    LocationData? locationData = await _getLocation();
    if (locationData != null) {
      final placeMark = service.getPlaceMark(locationData: locationData);
      placeMark.then((placeMark) => locationName = placeMark!.administrativeArea);
    }
    BaseWeatherRemoteDatasource weatherRemoteDatasource =
        BaseWeatherRemoteDatasource(_createAndSetupDio());

    BaseWeatherRepository weatherRepository = WeatherRepository(
        weatherRemoteDatasource: weatherRemoteDatasource, weatherLocalDatabase: WeatherLocalDatabase());

    final Either<Failure, Weather> weather = await GetWeatherUseCase(weatherRepository)
        .call(locationData!.latitude!.toDouble(), locationData.longitude!);
    debugPrint(weather.isRight().toString());
    weather.fold((l) => emit(HomeFailed()), (r) => emit(WeatherGotSuccessfully(weather: r)));

    debugPrint('after');
  }

  Future<void> _getLocationName() async {
    emit(HomeLoading());
    LocationData? locationData = await _getLocation();
    final service = LocationService();
    if (locationData != null) {
      final placeMark = await service.getPlaceMark(locationData: locationData);
      emit(LocationGotSuccessfully());
    } else {
      emit(HomeFailed());
    }
  }

  Dio _createAndSetupDio() {
    Dio dio = Dio();
    dio
      ..options.connectTimeout = 200 * 1000
      ..options.receiveTimeout = 200 * 1000;

    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: false,
      responseHeader: false,
      request: true,
      requestBody: true,
    ));
    return dio;
  }
}
