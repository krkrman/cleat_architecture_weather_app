import 'package:cleat_architecture_weather_app/core/errors/exceptions.dart';
import 'package:cleat_architecture_weather_app/core/utils/app_strings.dart';
import 'package:cleat_architecture_weather_app/core/utils/helper.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/data/models/weather_model.dart';

abstract class BaseWeatherLocalDatabase {
  Future<WeatherModel> getLastWeatherData();

  Future<void> cacheWeatherData(WeatherModel weatherModel);
}

class WeatherLocalDatabase extends BaseWeatherLocalDatabase {
  @override
  Future<void> cacheWeatherData(WeatherModel weatherModel) async {
    await Helper.hiveBox.put(AppStrings.weatherHiveKey, weatherModel.toMap());
  }

  @override
  Future<WeatherModel> getLastWeatherData() async {
    Map<String, dynamic>? weatherMap = await Helper.hiveBox.get(AppStrings.weatherHiveKey);
    if (weatherMap != null) {
      WeatherModel weatherModel = WeatherModel.fromMap(weatherMap);
      return weatherModel;
    } else {
      throw EmptyCacheException;
    }
  }
}
