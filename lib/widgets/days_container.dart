// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:days_counter/constants/palette.dart';

class DaysContainer extends StatelessWidget {
  const DaysContainer({
    Key? key,
    required this.title,
    required this.days,
    required this.color,
  }) : super(key: key);

  final String title;
  final int days;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 50.0,
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 2),
                color: Colors.black54.withOpacity(0.5),
                blurRadius: 2.0,
              ),
            ],
          ),
        ),
        Positioned(
          right: 7.0,
          top: -10.0,
          child: Container(
            width: 70.0,
            height: 70.0,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(
                width: 5.0,
                color: const Color(0xFFEEEEF3),
              ),
            ),
            child: Center(
              child: Text(
                days.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  shadows: [
                    Shadow(
                      color: Colors.black54,
                      blurRadius: 3.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 10.0,
          left: 70.0,
          child: SizedBox(
            height: 30.0,
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Palette.kSecondaryLightColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
