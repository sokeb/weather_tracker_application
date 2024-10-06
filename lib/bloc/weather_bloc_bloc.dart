import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../data/api_caller.dart';
import '../data/model/weather_data_model.dart';
import '../data/service/get_address.dart';

part 'weather_bloc_event.dart';

part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {


  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherBlocLoading());
      try {
        WeatherDataModel weatherData = await ApiCall().getCurrentWeather(
          event.position.latitude,
          event.position.longitude,
        );
        Placemark placeMark = await getAddress(event.position.latitude, event.position.longitude);

        emit(WeatherBlocSuccess(weatherData, placeMark));
      } catch (e) {
        emit(WeatherBlocFailure());
      }
    });
  }
}
