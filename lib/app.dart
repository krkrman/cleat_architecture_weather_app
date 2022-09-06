import 'package:cleat_architecture_weather_app/config/themes/app_theme.dart';
import 'package:cleat_architecture_weather_app/config/themes/theme_cubit.dart';
import 'package:cleat_architecture_weather_app/core/utils/app_strings.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/presentation/manager/home_cubit.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          debugPrint(ThemeCubit.themeMode.toString());
          return MaterialApp(
            title: AppStrings.appName,
            debugShowCheckedModeBanner: false,
            themeMode: ThemeCubit.themeMode,
            theme: AppTheme().lightTheme,
            darkTheme: AppTheme().darkTheme,
            home: BlocProvider(
              create: (context) => HomeCubit(),
              child: const HomeScreen(),
            ),
          );
        },
      ),
    );
  }
}
