class ForecastDay {
  final String day; // Mon, Tue...
  final String minTemp; // 10°
  final String maxTemp; // 20°
  final String icon; // asset or url

  const ForecastDay({
    required this.day,
    required this.minTemp,
    required this.maxTemp,
    required this.icon,
  });
}
