import 'package:flutter/material.dart';

extension ThemeValues on BuildContext {
  TextStyle? get headLine1 => Theme.of(this).textTheme.headline1;

  TextStyle? get headLine2 => Theme.of(this).textTheme.headline2;

  TextStyle? get headLine3 => Theme.of(this).textTheme.headline3;

  TextStyle? get headLine4 => Theme.of(this).textTheme.headline4;

  TextStyle? get headLine5 => Theme.of(this).textTheme.headline5;

  TextStyle? get headLine6 => Theme.of(this).textTheme.headline6;

  TextStyle? get bodyText1 => Theme.of(this).textTheme.bodyText1;

  TextStyle? get bodyText2 => Theme.of(this).textTheme.headline2;
}

class AppTextStyle {
  static const TextStyle currentTemp =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w200, fontSize: 80);
  static const TextStyle largeStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 40);
  static const TextStyle medium =
      TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 20);
  static const TextStyle smallStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);
}
