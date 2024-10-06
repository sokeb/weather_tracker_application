part of 'weather_bloc_bloc.dart';

sealed class WeatherBlocState extends Equatable {
  const WeatherBlocState();
  
  @override
  List<Object> get props => [];
}

final class WeatherBlocInitial extends WeatherBlocState {}

final class WeatherBlocLoading extends WeatherBlocState {}

final class WeatherBlocFailure extends WeatherBlocState {}

final class WeatherBlocSuccess extends WeatherBlocState {
	final WeatherDataModel weatherData;
  final Placemark placeMark;

	const WeatherBlocSuccess(this.weatherData, this.placeMark);

	@override
  List<Object> get props => [weatherData];
}
