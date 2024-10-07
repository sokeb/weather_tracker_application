import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../bloc/weather_bloc_bloc.dart';

class WeatherSituationInfoSection extends StatelessWidget {
  const WeatherSituationInfoSection({
    super.key,
    required this.state,
  });

  final WeatherBlocSuccess state;

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
              '${state.weatherData.main!.temp!.toInt()}°',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 55,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              state.weatherData.weather![0].main!,
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
              state.weatherData.main!.feelsLike!.toInt() < 30
                  ? 'assets/animation/minTamp.json'
                  : 'assets/animation/maxTamp.json',
              height: 30,
              width: 20,
            ),
            Text(
              '${state.weatherData.main!.tempMax!.round()}°/${state.weatherData.main!.tempMin!.round()}° Feels like ${state.weatherData.main!.feelsLike!.toInt()}°',
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
