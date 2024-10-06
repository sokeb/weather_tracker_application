import 'package:weather_tracker_application/constants/urls.dart';
import 'package:weather_tracker_application/data/model/network_response.dart';
import 'package:weather_tracker_application/data/model/weather_data_model.dart';
import 'package:weather_tracker_application/data/service/network_caller.dart';

class ApiCall {
  Future<WeatherDataModel> getCurrentWeather(double lat, double long) async {
    WeatherDataModel weatherData;
    final NetworkResponse response = await NetworkCaller.getRequest(
        url: Urls.constructWeatherUrl(lat, long));
    if (response.statusCode != 200) {
      throw 'An unexpected error occurred';
    }
      weatherData = WeatherDataModel.fromJson(response.responseData);
      print('done');
      return weatherData;
    }
  }


