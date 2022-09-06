import 'dart:ui';

import 'package:cleat_architecture_weather_app/core/utils/AppTextStyle.dart';
import 'package:cleat_architecture_weather_app/core/widgets/custom_text.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/domain/entities/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SunWidget extends StatelessWidget {
  Weather weather;

  SunWidget({
    required this.weather,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18.0),
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white38, width: 0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const CustomText(
                  text: 'Sunrise',
                  style: AppTextStyle.medium,
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomText(
                  text: DateFormat('h:mm a').format(weather.sunrise),
                  style: AppTextStyle.medium,
                ),
              ],
            ),
            Column(
              children: [
                const CustomText(
                  text: 'Sunset',
                  style: AppTextStyle.medium,
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomText(
                  text: DateFormat('h:mm a').format(weather.sunset),
                  style: AppTextStyle.medium,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
