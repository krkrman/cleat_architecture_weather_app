import 'dart:math';

import 'package:cleat_architecture_weather_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Helper {
  static var hiveBox = Hive.box(AppStrings.hiveBox);

  /// navigate to another screen
  static void navigateTo(BuildContext context, Widget destinationScreen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destinationScreen),
    );
  }

  static void navigateAndFinish(BuildContext context, Widget destinationScreen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => destinationScreen),
    );
  }

  static void navigateAndPopAllPages(BuildContext context, Widget destinationScreen) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => destinationScreen),
      (route) {
        return false;
      },
    );
  }

  static int getRandomNumber() {
    Random random = Random(DateTime.now().millisecondsSinceEpoch);
    return random.nextInt(2000000000);
  }

  static DateTime convertTimestampToDateTime(int timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: false);
  }

  /// need Flutter Toast
/*
void showToast({
  @required String text,
  @required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

// enum
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}
*/

}
