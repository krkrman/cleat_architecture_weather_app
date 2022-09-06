import 'package:cleat_architecture_weather_app/core/utils/app_colors.dart';
import 'package:cleat_architecture_weather_app/core/utils/app_font_sizes.dart';
import 'package:cleat_architecture_weather_app/core/utils/app_radius.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData lightTheme = ThemeData();
  ThemeData darkTheme = ThemeData();

  AppTheme() {
    lightTheme = ThemeData(
      primaryColor: AppColors.primary,
      hintColor: AppColors.hint,
      disabledColor: Colors.grey,
      fontFamily: null,
      inputDecorationTheme: getBorderedInputDecoration(),
      scaffoldBackgroundColor: const Color(0xff5F96CE),
      cardColor: AppColors.card,
      appBarTheme: getAppBarTheme(),
      textButtonTheme: getTextButtonDarkTheme(),
      iconTheme: IconThemeData(color: AppColors.icon),
      cardTheme: getCardTheme(),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.button,
        disabledColor: AppColors.disableButton,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppRadius.button),
          ),
        ),
      ),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: AppColors.floatingActionButton),
    );
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    darkTheme = ThemeData(
      primaryColor: AppColors.primaryDark,
      hintColor: AppColors.hint,
      disabledColor: Colors.grey,
      fontFamily: null,
      cardColor: AppColors.cardDark,
      inputDecorationTheme: getBorderedInputDecoration(),
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: getAppBarDarkTheme(),
      textButtonTheme: getTextButtonDarkTheme(),
      iconTheme: IconThemeData(color: AppColors.iconDark),
      cardTheme: getCardDarkTheme(),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.buttonDark,
        disabledColor: AppColors.disableButton,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppRadius.button),
          ),
        ),
      ),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: AppColors.floatingActionButtonDark),
    );
  }

  InputDecorationTheme getBorderedInputDecoration() {
    return InputDecorationTheme(
      labelStyle: TextStyle(
        color: AppColors.label,
      ),
      prefixIconColor: AppColors.textFormFieldIcon,
      suffixIconColor: AppColors.textFormFieldIcon,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.textFormField)),
      ),
    );
  }

  CardTheme getCardTheme() {
    return CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      clipBehavior: Clip.antiAlias,
      color: AppColors.card,
    );
  }

  CardTheme getCardDarkTheme() {
    return CardTheme(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      color: AppColors.cardDark,
    );
  }

  AppBarTheme getAppBarTheme() {
    return AppBarTheme(
      color: AppColors.appBar,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.appBarIcon,
      ),
    );
  }

  AppBarTheme getAppBarDarkTheme() {
    return AppBarTheme(
      color: AppColors.appBarDark,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.appBarIconDark,
      ),
    );
  }

  TextButtonThemeData getTextButtonTheme() {
    return TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(AppColors.textButton),
      ),
    );
  }

  TextButtonThemeData getTextButtonDarkTheme() {
    return TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(AppColors.textButtonDark),
      ),
    );
  }
}
