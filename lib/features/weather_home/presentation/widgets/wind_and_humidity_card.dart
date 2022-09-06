import 'dart:ui';

import 'package:cleat_architecture_weather_app/core/utils/AppTextStyle.dart';
import 'package:cleat_architecture_weather_app/core/widgets/custom_text.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/domain/entities/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class WindAndHumidityCard extends StatelessWidget {
  Weather weather;

  WindAndHumidityCard({
    required this.weather,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        height: 120,
        padding: const EdgeInsets.all(18.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white38, width: 0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const Icon(Icons.wind_power),
                const SizedBox(
                  height: 5,
                ),
                const CustomText(
                  text: 'Wind',
                  style: AppTextStyle.medium,
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomText(
                  text: '${weather.windSpeed} Km/h',
                  style: AppTextStyle.medium,
                ),
              ],
            ),
            Column(
              children: [
                const Icon(Icons.water_drop_outlined, color: Colors.white),
                const SizedBox(
                  height: 5,
                ),
                const CustomText(
                  text: 'Humidity',
                  style: AppTextStyle.medium,
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomText(
                  text: '${weather.humidityPercentage} %',
                  style: AppTextStyle.medium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
