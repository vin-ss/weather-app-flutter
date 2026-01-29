import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/colors.dart';

class InfosPill extends StatelessWidget {
  const InfosPill({
    super.key,
    required this.width,
    required this.height,
    required this.precipitation,
    required this.humidity,
    required this.wind,
  });

  final double width;
  final double height;
  final String precipitation;
  final String humidity;
  final String wind;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.055,
          vertical: height * 0.015,
        ),
        width: width * 0.875,
        decoration: BoxDecoration(
          color: Color(0xffE9E7FF),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(width * 0.1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/umbrella.png',
                    width: width * 0.06,
                    height: width * 0.06,
                  ),
                  SizedBox(height: height * 0.006),
                  Text(
                    '$precipitation%',
                    style: TextStyle(
                      color: AppColors.smallText,
                      fontSize: width * 0.035,
                    ),
                  ),
                  SizedBox(height: height * 0.006),
                  Text(
                    'Precipitation',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.smallText,
                      fontSize: width * 0.025,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/droplet.png',
                    width: width * 0.06,
                    height: width * 0.06,
                  ),
                  SizedBox(height: height * 0.006),
                  Text(
                    '$humidity%',
                    style: TextStyle(
                      color: AppColors.smallText,
                      fontSize: width * 0.035,
                    ),
                  ),
                  SizedBox(height: height * 0.006),
                  Text(
                    'Humidity',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.smallText,
                      fontSize: width * 0.025,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/wind.png',
                    width: width * 0.06,
                    height: width * 0.06,
                  ),
                  SizedBox(height: height * 0.006),
                  Text(
                    '${wind}km/h',
                    style: TextStyle(
                      color: AppColors.smallText,
                      fontSize: width * 0.035,
                    ),
                  ),
                  SizedBox(height: height * 0.006),
                  Text(
                    'Wind',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.smallText,
                      fontSize: width * 0.025,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
