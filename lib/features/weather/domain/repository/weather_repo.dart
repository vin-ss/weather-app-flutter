import 'package:weather_app/features/weather/domain/entity/weather.dart';

abstract interface class WeatherRepo {
  Future<Weather> getWeatherByCity(String city);
}
