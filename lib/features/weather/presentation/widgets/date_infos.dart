import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/colors.dart';

class DateInfos extends StatelessWidget {
  const DateInfos({
    super.key,
    required this.width,
    required this.height,
    required this.temp,
    required this.icon,
  });

  final double width;
  final double height;
  final String temp;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Text(
            temp,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: AppColors.largeText,
              fontSize: width * 0.375,
              fontWeight: FontWeight.bold,
            ),
          ),
          Positioned(
            bottom: height * 0.025,
            right: -width * 0.125,
            child: Image.asset(icon, width: width * 0.3, height: width * 0.3),
          ),
        ],
      ),
    );
  }
}
