import 'package:geolocator/geolocator.dart';

import 'constants.dart';

class Urls{

  static const baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const weeklyWeatherUrl =
      'https://api.open-meteo.com/v1/forecast?current=&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto';


  static String constructWeatherUrl(double lat, double lon) =>
      '$baseUrl/weather?lat=$lat&lon=$lon&units=metric&appid=${Constants
          .apiKey}';

  static String constructForecastUrl(double lat, double lon) =>
      '$baseUrl/forecast?lat=$lat&lon=$lon&units=metric&appid=${Constants
          .apiKey}';

  static String constructWeatherByCityUrl(String cityName) =>
      '$baseUrl/weather?q=$cityName&units=metric&appid=${Constants.apiKey}';

  static String constructWeeklyForecastUrl(double lat, double lon) =>
      '$weeklyWeatherUrl&latitude=$lat&longitude=$lon';
}