import 'dart:ui';

import 'package:cleat_architecture_weather_app/core/utils/AppTextStyle.dart';
import 'package:cleat_architecture_weather_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class today_temp extends StatelessWidget {
  const today_temp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white38, width: 0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CustomText(
              alignment: Alignment.center,
              text: 'Today\'s temperature',
              style: AppTextStyle.medium,
              fontWeight: FontWeight.bold,
            ),
            CustomText(
              text: 'Expect the same as yesterday',
              style: AppTextStyle.medium,
              alignment: Alignment.center,
              fontSize: 18,
            ),
          ],
        ),
      ),
    );
  }
}
