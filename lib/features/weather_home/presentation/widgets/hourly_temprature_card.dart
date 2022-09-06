import 'dart:ui';

import 'package:cleat_architecture_weather_app/core/utils/AppTextStyle.dart';
import 'package:cleat_architecture_weather_app/core/widgets/custom_text.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/domain/entities/weather.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HourlyTemperatureCard extends StatelessWidget {
  Weather weather;

  HourlyTemperatureCard({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime currentDateTime = weather.dates[0];

    int maxTemp = weather.temps[0];
    weather.temps.map((element) {
      if (element > maxTemp) maxTemp = element;
    });

    return Card(

      child: Container(
        width: double.infinity,
        height: 200,
        padding: const EdgeInsets.all(18.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white38, width: 0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: weather.dates.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return SizedBox(
                height: double.infinity,
                width: 55,
                child: Column(
                  children: [
                    CustomText(
                      style: AppTextStyle.smallStyle,
                      text: DateFormat('h a').format(weather.dates[index]),
                    ),
                    Image.network(
                      'http://openweathermap.org/img/wn/${weather.icons[index]}@2x.png',
                    ),
                    CustomText(
                      text: '  ${weather.temps[index]}°',
                      style: AppTextStyle.smallStyle,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 40,
                      child: CustomPaint(
                        painter: OpenPainter(
                            offset: (maxTemp - weather.temps[index]).toDouble(),
                            nextOffset: maxTemp -
                                (weather.temps[index != (weather.temps.length - 1) ? (index + 1) : (0)])
                                    .toDouble(),
                            isLastPoint: index == weather.temps.length - 1),
                      ),
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.water_drop,
                          size: 15,
                        ),
                        CustomText(
                          text: '0%',
                          style: AppTextStyle.smallStyle,
                        )
                      ],
                    )
                  ],
                ));
          },
        ),
      ),
    );
  }
}

class OpenPainter extends CustomPainter {
  double offset;
  double nextOffset;
  bool isLastPoint = false;

  OpenPainter({this.offset = 0, this.nextOffset = 0, this.isLastPoint = false});

  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round //rounded points
      ..strokeWidth = 5;

    var paintLine = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round //rounded points
      ..strokeWidth = 1;
    //list of points
    var points = [Offset(-10, offset + 10)];
    //draw points on canvas
    canvas.drawPoints(PointMode.points, points, paint1);
    if (!isLastPoint) {
      canvas.drawLine(Offset(-10, offset + 10), Offset(45, nextOffset + 10), paintLine);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
