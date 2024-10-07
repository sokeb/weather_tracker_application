import 'package:weather_tracker_application/constants/urls.dart';
import 'package:weather_tracker_application/data/model/network_response.dart';
import 'package:weather_tracker_application/data/service/network_caller.dart';

class ApiCall {
  Future<NetworkResponse> getCurrentWeather(double lat, double long) async {
    
    final NetworkResponse response = await NetworkCaller.getRequest(
        url: Urls.constructWeatherUrl(lat, long));
    if (response.statusCode != 200) {
      throw 'An unexpected error occurred';
    }
      print('done');
      return NetworkResponse(isSuccess: true, statusCode: 200, responseData: response.responseData);
    }
  }


