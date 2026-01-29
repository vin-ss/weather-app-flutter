import 'forecast_day.dart';

class Weather {
  final String date;
  final String temperature;
  final String humidity;
  final String precipitation;
  final String wind;
  final String conditionIcon;
  final List<ForecastDay> forecast;
  final List<double> hourlyForecast;

  const Weather({
    required this.date,
    required this.temperature,
    required this.humidity,
    required this.precipitation,
    required this.wind,
    required this.conditionIcon,
    required this.forecast,
    required this.hourlyForecast,
  });
}
