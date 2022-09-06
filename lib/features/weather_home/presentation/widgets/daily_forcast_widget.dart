import 'dart:ui';

import 'package:cleat_architecture_weather_app/core/utils/helper.dart';
import 'package:cleat_architecture_weather_app/core/utils/AppTextStyle.dart';
import 'package:cleat_architecture_weather_app/core/widgets/custom_text.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/domain/entities/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class DailyForcastWidget extends StatelessWidget {
  Weather weather;

  DailyForcastWidget({
    required this.weather,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = weather.dates[0];
    List<int> daysTemps = [-20];
    List<DateTime> dates = [dateTime];
    for (DateTime date in weather.dates) {
      if (dateTime.day != date.day) {
        dateTime = date;
        daysTemps.add(weather.temps[weather.dates.indexOf(dateTime)]);
        dates.add(dateTime);
      }
      if (dateTime.day == date.day && weather.temps[weather.dates.indexOf(dateTime)] > daysTemps.last) {
        daysTemps.removeLast();
        daysTemps.add(weather.temps[weather.dates.indexOf(dateTime)]);
      }
    }
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white38, width: 0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: dates.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  CustomText(
                    width: 120,
                    text: DateFormat('EEEE').format(dates[index]),
                    style: AppTextStyle.smallStyle,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.water_drop,
                    size: 12,
                  ),
                  const CustomText(
                    text: '0%',
                    style: AppTextStyle.smallStyle,
                  ),
                  const Spacer(),
                  const Icon(Icons.sunny, size: 25, color: Colors.orange),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomText(
                    style: AppTextStyle.smallStyle,
                    text: daysTemps[index].toString(),
                  ),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 15,
              );
            },
          ),
        ),
      ),
    );
  }
}
