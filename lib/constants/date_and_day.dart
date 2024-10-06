import 'package:intl/intl.dart';

class DateAndTime{
  static String date = DateFormat('MMMMd').format(DateTime.now());

  static String dayName = DateFormat('EEEE').format(DateTime.now());
}