import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_tracker_application/ui/widgets/home_screen_widgets/sun_details_section.dart';
import '../../../bloc/weather_bloc_bloc.dart';
import 'InfoCard.dart';

class DayDetailsSection extends StatelessWidget {
  const DayDetailsSection({
    super.key,
    required this.state,
  });

  final WeatherBlocSuccess state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InfoCard(
              title: ' Wind',
              details:
                  ' ${state.weatherData.wind!.speed!.toStringAsFixed(0)} Km/h',
              icon: const Icon(
                CupertinoIcons.wind,
                size: 25,
                color: Colors.white54,
              ),
            ),
            InfoCard(
              title: ' Cloud',
              details:
                  ' ${state.weatherData.clouds!.all!.toStringAsFixed(0)} %',
              icon: const Icon(
                CupertinoIcons.cloud,
                size: 25,
                color: Colors.white54,
              ),
            )
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InfoCard(
              title: ' Humidity',
              details:
                  ' ${state.weatherData.main!.humidity!.toStringAsFixed(0)} %',
              icon: const Icon(
                CupertinoIcons.drop,
                size: 25,
                color: Colors.white54,
              ),
            ),
            InfoCard(
              title: ' Wind',
              details:
                  ' ${state.weatherData.main!.pressure!.toStringAsFixed(0)} mb',
              icon: const Icon(
                Icons.compress,
                size: 25,
                color: Colors.white54,
              ),
            )
          ],
        ),
      ],
    );
  }
}
