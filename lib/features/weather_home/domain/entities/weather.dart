class Weather {
  int currentTemp, feelsLike;
  List<DateTime> dates;
  List<int> temps;
  DateTime sunrise, sunset;
  int windSpeed, humidityPercentage;
  String location;
  List<String> icons;

  Weather({
    required this.currentTemp,
    required this.feelsLike,
    required this.dates,
    required this.temps,
    required this.sunrise,
    required this.sunset,
    required this.windSpeed,
    required this.humidityPercentage,
    required this.location,
    required this.icons,
  });
}
