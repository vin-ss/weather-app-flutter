import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/func/app_routing.dart';
import 'package:weather_app/core/theme/colors.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather/presentation/pages/choose_location_screen.dart';
import 'package:weather_app/features/weather/presentation/widgets/custom_date.dart';
import 'package:weather_app/features/weather/presentation/widgets/customed_app_bar.dart';
import 'package:weather_app/features/weather/presentation/widgets/date_infos.dart';
import 'package:weather_app/features/weather/presentation/widgets/hourly_weather_graph.dart';
import 'package:weather_app/features/weather/presentation/widgets/infos_pill.dart';
import 'package:weather_app/features/weather/presentation/widgets/upper_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is WeatherError) {
            return Center(
              child: Text(
                'Failed to load weather data, try again later',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (state is WeatherLoaded) {
            final weather = state.weather;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UpperContainer(
                    height: height,
                    width: width,
                    children: [
                      CustomedAppBar(
                        width: width,
                        location: state.city,
                        onLocationPressed: () {
                          AppRouting.pushWithFadeTransition(
                            context,
                            ChooseLocationScreen(),
                          );
                        },
                      ),

                      SizedBox(height: height * 0.01),

                      CustomDate(date: weather.date),

                      SizedBox(height: height * 0.04),

                      DateInfos(
                        width: width,
                        height: height,
                        temp: weather.temperature,
                        icon: weather.conditionIcon,
                      ),

                      SizedBox(height: height * 0.025),

                      InfosPill(
                        width: width,
                        height: height,
                        precipitation: weather.precipitation,
                        humidity: weather.humidity,
                        wind: weather.wind,
                      ),

                      SizedBox(height: height * 0.025),

                      Expanded(
                        child: HourlyWeatherGraph(
                          hourlyForecast: weather.hourlyForecast,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.04),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Text(
                      '7 days forecast',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.smallText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  /// 🔹 7 DAYS FORECAST LIST
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: SizedBox(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: weather.forecast.length,
                        itemBuilder: (context, index) {
                          final day = weather.forecast[index];

                          return Container(
                            width: 70,
                            margin: EdgeInsets.only(right: width * 0.03),
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xff4C4DDB),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  day.day,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),

                                Image.asset(day.icon, width: 30, height: 30),

                                Text(
                                  day.minTemp,
                                  style: Theme.of(context).textTheme.labelLarge!
                                      .copyWith(color: AppColors.white),
                                ),

                                Text(
                                  day.maxTemp,
                                  style: Theme.of(context).textTheme.labelLarge!
                                      .copyWith(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          // 🟡 Initial
          return const SizedBox();
        },
      ),
    );
  }
}
