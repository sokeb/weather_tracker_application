import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget getWeatherView(int code) {
  switch (code) {
    case >= 200 && < 300:
      return Lottie.asset('assets/animation/thunderstorm.json',
          fit: BoxFit.scaleDown);
    case >= 300 && < 400:
      return Lottie.asset('assets/animation/drizzle.json',
          fit: BoxFit.scaleDown);
    case >= 500 && < 600:
      return Lottie.asset('assets/animation/rainy.json', fit: BoxFit.scaleDown);
    case >= 600 && < 700:
      return Lottie.asset('assets/animation/loading.json',
          fit: BoxFit.scaleDown);
    case >= 700 && < 800:
      return Lottie.asset('assets/animation/mist.json', fit: BoxFit.scaleDown);
    case == 800:
      return Lottie.asset('assets/animation/sunny.json', fit: BoxFit.scaleDown);
    case > 800 && < 900:
      return Lottie.asset('assets/animation/cloud.json', fit: BoxFit.scaleDown);
      break;
    default:
      return Lottie.asset('assets/animation/clear.json', fit: BoxFit.scaleDown);
  }
}
