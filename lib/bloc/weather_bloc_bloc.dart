import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_tracker_application/data/service/api%20_caller.dart';
import '../data/model/network_response.dart';
import '../data/model/weather_data_model.dart';
import '../data/service/get_address.dart';

part 'weather_bloc_event.dart';

part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {


  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherBlocLoading());
      try {
        NetworkResponse response = await ApiCall().getCurrentWeather(
          event.position.latitude,
          event.position.longitude,
        );
        if(response.statusCode ==200){
          WeatherDataModel weatherData = WeatherDataModel.fromJson(response.responseData);

          Placemark placeMark = await getAddress(event.position.latitude, event.position.longitude);

          emit(WeatherBlocSuccess(weatherData, placeMark));
        }

      } catch (e) {
        emit(WeatherBlocFailure());
      }
    });
  }
}
