import 'package:flutter/material.dart';

class UpperContainer extends StatelessWidget {
  const UpperContainer({
    super.key,
    required this.height,
    required this.width,
    required this.children,
  });

  final double height;
  final double width;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height * 0.75,
      decoration: BoxDecoration(
        color: Color(0xffF1F1F1),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(width * 0.075),
          bottomRight: Radius.circular(width * 0.075),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          right: width * 0.05,
          left: width * 0.05,
          top: height * 0.07,
          bottom: height * 0.03,
        ),
        child: Column(children: children),
      ),
    );
  }
}
