import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
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
              details: ' ${state.weather.windSpeed!.toStringAsFixed(0)} Km/h',
              icon: const Icon(
                CupertinoIcons.wind,
                size: 25,
                color: Colors.white54,
              ),
            ),
            InfoCard(
              title: ' Cloud',
              details: ' ${state.weather.cloudiness!.toStringAsFixed(0)} %',
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
              details: ' ${state.weather.humidity!.toStringAsFixed(0)} %',
              icon: const Icon(
                CupertinoIcons.drop,
                size: 25,
                color: Colors.white54,
              ),
            ),
            InfoCard(
              title: ' Wind',
              details: ' ${state.weather.pressure!.toStringAsFixed(0)} mb',
              icon: const Icon(
                Icons.compress,
                size: 25,
                color: Colors.white54,
              ),
            )
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 150,
          width: MediaQuery.sizeOf(context).width - 10,
          child: Card(
            color: Colors.transparent,
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(0, -1),
                  child: Lottie.asset(
                    'assets/animation/sun.json',
                    height: 270,
                    width: 270,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                sunUpAndDown(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget sunUpAndDown() {
    return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Sunrise',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white54,
                                fontWeight: FontWeight.w300)),
                        Text(
                            DateFormat()
                                .add_jm()
                                .format(state.weather.sunrise!),
                            style: const TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Sunset',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white54,
                                fontWeight: FontWeight.w300)),
                        Text(
                            DateFormat()
                                .add_jm()
                                .format(state.weather.sunset!),
                            style: const TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                      ],
                    )
                  ],
                ),
              );
  }
}
