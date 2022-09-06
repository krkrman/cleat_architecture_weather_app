part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class WeatherGotSuccessfully extends HomeState {
  Weather weather;

  WeatherGotSuccessfully({
    required this.weather,
  });
}

class HomeFailed extends HomeState {}

class LocationGotSuccessfully extends HomeState {}
