import 'package:flutter/material.dart';

class CustomDate extends StatelessWidget {
  final String date;
  const CustomDate({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        date,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Color(0xff8986EF),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
