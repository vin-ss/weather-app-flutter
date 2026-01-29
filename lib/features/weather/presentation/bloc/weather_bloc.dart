import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/location/domain/entity/user_location.dart';
import 'package:weather_app/features/location/domain/usecases/get_location_use_case.dart';
import 'package:weather_app/features/location/domain/usecases/save_location_use_case.dart';
import 'package:weather_app/features/weather/domain/entity/weather.dart';
import 'package:weather_app/features/weather/domain/repository/weather_repo.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepo weatherRepo;
  final GetLocationUseCase getLocation;
  final SaveLocationUseCase saveLocation;

  WeatherBloc({
    required this.weatherRepo,
    required this.getLocation,
    required this.saveLocation,
  }) : super(WeatherInitial()) {
    on<LoadDefaultWeather>(_loadDefault);
    on<WeatherEventGetWeatherByCity>(_changeCity);
  }

  Future<void> _loadDefault(
    LoadDefaultWeather event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());

    try {
      final location = await getLocation();
      final city = location?.city ?? 'Batna';

      final weather = await weatherRepo.getWeatherByCity(city);

      emit(WeatherLoaded(weather: weather, city: city));
    } catch (e) {
      emit(WeatherError('Failed to load weather: $e'));
    }
  }

  Future<void> _changeCity(
    WeatherEventGetWeatherByCity event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());

    try {
      final weather = await weatherRepo.getWeatherByCity(event.city);

      await saveLocation(UserLocation(country: '', city: event.city));

      emit(WeatherLoaded(weather: weather, city: event.city));
    } catch (e) {
      emit(WeatherError('Failed to load weather: $e'));
    }
  }
}
