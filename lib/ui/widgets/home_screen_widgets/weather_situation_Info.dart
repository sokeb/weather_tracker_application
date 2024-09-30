import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WeatherSituationInfoSection extends StatelessWidget {
  const WeatherSituationInfoSection({
    super.key,
    required this.temp,
    required this.weatherStatus,
    required this.temMax,
    required this.temMin,
    required this.feelsLike,
  });

  final String temp;
  final String weatherStatus;
  final String temMax;
  final String temMin;
  final int feelsLike;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              temp,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 55,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              weatherStatus,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Row(
          children: [
            Lottie.asset(
              feelsLike < 30
                  ? 'assets/animation/minTamp.json'
                  : 'assets/animation/maxTamp.json',
              height: 30,
              width: 20,
            ),
            Text(
              '$temMax/$temMin Feels like $feelsLike',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }
}
