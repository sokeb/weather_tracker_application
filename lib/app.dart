import 'package:flutter/material.dart';
import 'package:weather_tracker_application/bloc/weather_bloc_bloc.dart';
import 'package:weather_tracker_application/ui/screen/home_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_tracker_application/ui/screen/loading_page.dart';
import 'data/service/get_location.dart';


class WeatherTracker extends StatelessWidget {
  const WeatherTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: determinePosition(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return BlocProvider(
                create: (context) =>
                WeatherBlocBloc()..add(FetchWeather(snapshot.data as Position)),
                child: const HomeScreen(),
              );
            } else {
              return const Scaffold(
                body: Center(
                  child: LoadingPage(),
                ),
              );
            }
          },
        ));
  }
}

