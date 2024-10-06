import 'dart:async';
import 'package:geocoding/geocoding.dart';

Future<Placemark> getAddress(lat, long) async {
  List<Placemark> placeMarkList =
  await placemarkFromCoordinates(lat, long);
  Placemark placeMark = placeMarkList[0];

  return placeMark;
  }
