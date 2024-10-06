import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_tracker_application/bloc/weather_bloc_bloc.dart';
import '../widgets/background_style.dart';
import '../widgets/home_screen_widgets/day_details_section.dart';
import '../widgets/home_screen_widgets/location_info_section.dart';
import '../widgets/home_screen_widgets/sun_details_section.dart';
import '../widgets/home_screen_widgets/weather_situation_Info.dart';
import '../widgets/home_screen_widgets/weather_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        //extendBodyBehindAppBar: true,
        body: SafeArea(
          child: Stack(
            children: [
              const BackgroundStyle(),
              BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                  builder: (context, state) {
                if (state is WeatherBlocSuccess) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LocationInfoSection(
                            placeMark: state.placeMark,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: SizedBox(
                              height: 300,
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: SizedBox(
                                      height: 250,
                                      width: 200,
                                      child: getWeatherView(
                                          state.weatherData.weather![0].id!),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: WeatherSituationInfoSection(
                                      state: state,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          DayDetailsSection(state: state),
                          const SizedBox(height: 10),
                          SunDetailsSection(state: state)
                        ],
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: Lottie.asset(
                      'assets/animation/clear.json',
                      height: 350,
                      width: MediaQuery.of(context).size.width,
                    ),
                  );
                }
              })
            ],
          ),
        ));
  }
}
//padding: const EdgeInsets.fromLTRB(20, 1.2 * kToolbarHeight, 20, 10),
