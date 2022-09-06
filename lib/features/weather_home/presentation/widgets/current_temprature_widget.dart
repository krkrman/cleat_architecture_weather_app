import 'dart:ui';

import 'package:cleat_architecture_weather_app/config/themes/app_theme.dart';
import 'package:cleat_architecture_weather_app/core/utils/AppTextStyle.dart';
import 'package:cleat_architecture_weather_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';

class CurrentTemperatureWidget extends StatelessWidget {
  String currentTemperature;

  CurrentTemperatureWidget({
    required this.currentTemperature,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        CustomText(
          text: "$currentTemperature°",
          style: AppTextStyle.currentTemp,
        ),
        const Spacer(),
        Lottie.asset('assets/lottie/sunny.json', width: 120, height: 120),
      ],
    );
  }
}
