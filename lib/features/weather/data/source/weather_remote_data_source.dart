import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/core/const/app_const.dart';

class WeatherRemoteDataSource {
  final http.Client client;

  WeatherRemoteDataSource({required this.client});

  Future<Map<String, dynamic>> getWeatherByCity(String city) async {
    final uri = Uri.parse(AppConst.forecastUrl).replace(
      queryParameters: {'key': dotenv.env['API_KEY']!, 'days': '7', 'q': city},
    );
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
