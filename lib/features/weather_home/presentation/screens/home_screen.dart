import 'package:cleat_architecture_weather_app/config/themes/app_theme.dart';
import 'package:cleat_architecture_weather_app/config/themes/theme_cubit.dart';
import 'package:cleat_architecture_weather_app/core/utils/media_query_values.dart';
import 'package:cleat_architecture_weather_app/core/utils/AppTextStyle.dart';
import 'package:cleat_architecture_weather_app/core/widgets/custom_text.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/domain/entities/weather.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/presentation/manager/home_cubit.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/presentation/widgets/current_temprature_widget.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/presentation/widgets/daily_forcast_widget.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/presentation/widgets/hourly_temprature_card.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/presentation/widgets/sun_widget.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/presentation/widgets/today_temp.dart';
import 'package:cleat_architecture_weather_app/features/weather_home/presentation/widgets/wind_and_humidity_card.dart';
import 'package:cleat_architecture_weather_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = ThemeCubit.get(context);

    HomeCubit homeCubit = HomeCubit.get(context);
    homeCubit.getWeatherData();

    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is WeatherGotSuccessfully) {
              //themeCubit.toggleTheme(true);
              DateTime now = DateTime.now();
              if (now.isAfter(state.weather.sunrise) && now.isBefore(state.weather.sunset)) {
                themeCubit.toggleTheme(false);
              } else {
                themeCubit.toggleTheme(true);
              }
              return getWeatherPage(context, state.weather);
            } else if (state is HomeLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              ));
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  Widget getWeatherPage(BuildContext context, Weather weather) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          expandedHeight: context.height * 0.35,
          collapsedHeight: context.height * 0.070,
          elevation: 0,
          floating: false,
          pinned: true,
          flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              double appBarHeight = constraints.biggest.height; //getting AppBar height
              bool isExpanded = appBarHeight > context.height * 0.2; //check if AppBar is expanded
              return FlexibleSpaceBar(
                expandedTitleScale: 1,
                background: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                  child: CurrentTemperatureWidget(currentTemperature: weather.temps[0].toString()),
                ),
                titlePadding: const EdgeInsets.only(bottom: 17),
                title: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      if (isExpanded)
                        const SizedBox(
                          width: 40,
                        ),
                      if (!isExpanded)
                        const SizedBox(
                          width: 50,
                        ),
                      Text(
                        weather.location,
                        style: AppTextStyle.largeStyle,
                      ),
                      const Icon(
                        Icons.location_on,
                      ),
                    ],
                  ),
                ),
                centerTitle: false,
              );
            },
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.dehaze,
            ),
            onPressed: () {},
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 40,
                  ),
                  CustomText(
                    text: '${weather.temps[0]} Feels like ${weather.feelsLike}° ',
                    style: AppTextStyle.smallStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 40,
                  ),
                  CustomText(
                    text:
                        '${DateFormat('EEEE').format(DateTime.now())}, ${DateFormat('h:mm a').format(DateTime.now())}',
                    style: AppTextStyle.smallStyle,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              HourlyTemperatureCard(
                weather: weather,
              ),
              const SizedBox(
                height: 20,
              ),
              const today_temp(),
              const SizedBox(
                height: 20,
              ),
              DailyForcastWidget(
                weather: weather,
              ),
              const SizedBox(
                height: 20,
              ),
              SunWidget(
                weather: weather,
              ),
              const SizedBox(
                height: 20,
              ),
              WindAndHumidityCard(weather: weather),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
