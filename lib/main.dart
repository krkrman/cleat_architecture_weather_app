import 'dart:io';

import 'package:cleat_architecture_weather_app/app.dart';
import 'package:cleat_architecture_weather_app/core/my_bloc_observer.dart';
import 'package:cleat_architecture_weather_app/core/utils/app_strings.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/data/models/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Directory appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await Hive.openBox(AppStrings.hiveBox);
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}