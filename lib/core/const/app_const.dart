class AppConst {
  AppConst._();
  static const String logo = 'assets/images/logo.png';
  static const tableName = 'user_location';
  static const String weather = 'assets/images/Weather.png';
  static const String _baseUrl = 'https://api.weatherapi.com/v1';
  static String get forecastUrl => '$_baseUrl/forecast.json';
}
