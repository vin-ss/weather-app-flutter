import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/presentation/widgets/curved_container_paint.dart';

class CurvedContainer extends StatelessWidget {
  final double height;
  final Color color;
  final Widget child;

  const CurvedContainer({
    super.key,
    required this.height,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        children: [
          // Shadow
          Positioned.fill(
            child: CustomPaint(
              painter: CurvedContainerPainter(
                color: Colors.black.withOpacity(0.05),
              ),
            ),
          ),

          // Main container
          Positioned.fill(
            top: -4,
            child: CustomPaint(
              painter: CurvedContainerPainter(color: color),
              child: Padding(padding: const EdgeInsets.all(24.0), child: child),
            ),
          ),
        ],
      ),
    );
  }
}
