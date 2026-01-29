import 'package:weather_app/features/weather/data/models/weather_model.dart';
import 'package:weather_app/features/weather/data/source/weather_remote_data_source.dart';
import 'package:weather_app/features/weather/domain/repository/weather_repo.dart';

class ImpWeatherRepo implements WeatherRepo {
  final WeatherRemoteDataSource remoteDataSource;

  ImpWeatherRepo({required this.remoteDataSource});

  @override
  Future<WeatherModel> getWeatherByCity(String city) async {
    final result = await remoteDataSource.getWeatherByCity(city);
    return WeatherModel.fromJson(result);
  }
}
