import 'package:weather_app/features/weather/domain/entity/forecast_day.dart';

import 'package:weather_app/features/weather/domain/entity/weather.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required super.date,
    required super.temperature,
    required super.humidity,
    required super.precipitation,
    required super.wind,
    required super.conditionIcon,
    required super.forecast,
    required super.hourlyForecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final current = json['current'];
    final forecastDays = json['forecast']['forecastday'] as List;

    return WeatherModel(
      date: json['location']['localtime'],
      temperature: '${current['temp_c'].round()}°',
      humidity: '${current['humidity']}%',
      precipitation: '${current['precip_mm']}%',
      wind: '${current['wind_kph']} km/h',
      conditionIcon: _mapIcon(current['condition']['text']),

      forecast: forecastDays.map<ForecastDay>((day) {
        final date = DateTime.parse(day['date']);

        return ForecastDay(
          day: _dayName(date),
          minTemp: '${day['day']['mintemp_c'].round()}°',
          maxTemp: '${day['day']['maxtemp_c'].round()}°',
          icon: _mapIcon(day['day']['condition']['text']),
        );
      }).toList(),
      hourlyForecast: (forecastDays[0]['hour'] as List)
          .map((e) => (e['temp_c'] as num).toDouble())
          .toList(),
    );
  }

  static String _dayName(DateTime date) {
    const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return days[date.weekday % 7];
  }

  static String _mapIcon(String condition) {
    final lower = condition.toLowerCase();
    if (lower.contains('thunder') ||
        lower.contains('storm') ||
        lower.contains('lightning')) {
      return 'assets/images/cloudlightning.png';
    }
    if (lower.contains('rain') ||
        lower.contains('drizzle') ||
        lower.contains('shower')) {
      return 'assets/images/cloudrain.png';
    }
    if (lower.contains('sun') || lower.contains('clear')) {
      return 'assets/images/sun.png';
    }
    // Default case (Cloudy, Windy, Foggy, etc.)
    return 'assets/images/cloud.png';
  }
}
