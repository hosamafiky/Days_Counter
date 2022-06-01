import 'dart:async';

import 'package:days_counter/constants/palette.dart';
import 'package:days_counter/widgets/circle_progress_bar.dart';
import 'package:days_counter/widgets/custom_button.dart';
import 'package:days_counter/widgets/days_container.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  Timer? timer;
  static const maxDays = 90;
  int currentDays = 0;
  bool isRunning = false;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (currentDays < maxDays) {
        setState(() {
          isRunning = true;
          currentDays++;
        });
      } else {
        stopTimer(reset: false);
      }
    });
  }

  void resetTimer() => setState(() => currentDays = 0);

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    timer?.cancel();
    setState(() {
      isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Palette.kPrimaryColor,
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          currentDays < maxDays
              ? '90 Days Without Bad Habit'
              : 'You\'re a CHAMPION,\nYou can acheive more.',
          style: TextStyle(
            color: currentDays < maxDays
                ? Palette.kSecondaryColor
                : Palette.kThirdColor,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 200.0,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      width: double.infinity,
                      height: 200.0,
                      color: Palette.kSecondaryColor,
                    ),
                    Positioned(
                      bottom: 140.0,
                      left: (size.width - 250) / 2,
                      child: CustomPaint(
                        foregroundPainter: CircleProgress(
                          currentDays / 90,
                          false,
                          Palette.kSecondaryDarkColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100.0),
              DaysContainer(
                title: 'Days Without Bad Habit',
                days: currentDays,
                color: Palette.kSecondaryColor,
              ),
              const SizedBox(height: 30.0),
              DaysContainer(
                title: 'The Remaining Days',
                days: 90 - currentDays,
                color: Palette.kThirdColor,
              ),
              const SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: isRunning ? 'Stop Counter' : 'Start Counter',
                    color: Palette.kThirdColor,
                    onTap: () =>
                        isRunning ? stopTimer(reset: false) : startTimer(),
                  ),
                  const SizedBox(width: 10.0),
                  CustomButton(
                    text: 'Reset Counter',
                    color: Palette.kSecondaryColor,
                    onTap: () => stopTimer(),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 110.0,
            left: 20.0,
            right: 20.0,
            child: Container(
              width: 150.0,
              height: 150.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Palette.kThirdColor,
                border: Border.all(
                  width: 4.0,
                  color: Palette.kThirdDarkColor,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '90 / $currentDays',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(
                          offset: Offset(1, 2),
                          color: Palette.kSecondaryLightColor,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Day',
                    style: TextStyle(
                      color: Palette.kThirdDarkColor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
