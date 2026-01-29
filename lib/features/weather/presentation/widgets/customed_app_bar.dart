import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weather_app/core/theme/colors.dart';

class CustomedAppBar extends StatelessWidget {
  const CustomedAppBar({
    super.key,
    required this.width,
    this.location,
    this.onLocationPressed,
  });
  final String? location;
  final VoidCallback? onLocationPressed;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: width * 0.075,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
            color: AppColors.smallText,
            iconSize: width * 0.07,
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
          ),
        ),
        Row(
          spacing: width * 0.025,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Iconsax.location,
              color: AppColors.mediumText,
              size: width * 0.07,
            ),
            Text(
              location ?? 'Location',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
        SizedBox(
          width: width * 0.075,
          child: IconButton(
            onPressed: onLocationPressed,
            icon: Icon(Iconsax.add_circle),
            color: AppColors.smallText,
            iconSize: width * 0.07,
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
          ),
        ),
      ],
    );
  }
}

// 0xffFF1F12
