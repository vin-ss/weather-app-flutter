part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

final class LoadDefaultWeather extends WeatherEvent {}

final class WeatherEventGetWeatherByCity extends WeatherEvent {
  final String city;

  WeatherEventGetWeatherByCity({required this.city});
}
