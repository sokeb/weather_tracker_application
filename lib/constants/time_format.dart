
import 'package:intl/intl.dart';

String getTime(final timeStamp) {
  DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
  String x = DateFormat('jm').format(time);
  return x;
}