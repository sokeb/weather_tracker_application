import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../bloc/weather_bloc_bloc.dart';
import '../../../constants/time_format.dart';

class SunDetailsSection extends StatelessWidget {
  const SunDetailsSection({
    super.key,
    required this.state,
  });

  final WeatherBlocSuccess state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SizedBox(
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
              Padding(
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
                        Text(getTime(state.weatherData.sys!.sunrise!),
                            // DateFormat()
                            //     .add_jm()
                            //     .format(state.weatherData.sys!.sunrise!),
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
                        Text(getTime(state.weatherData.sys!.sunset!),
                            // DateFormat()
                            //     .add_jm()
                            //     .format(state.weatherData.sunset!),
                            style: const TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
