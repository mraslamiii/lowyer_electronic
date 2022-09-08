import 'package:intl/intl.dart';

const String dateFormat = "yyyy-MM-dd HH:mm:ss";
const String serverDateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ";

String getDate(DateTime time) {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(time);
}

String getTime(DateTime time) {
  final DateFormat formatter = DateFormat('hh:mm');
  return formatter.format(time);
}

 getTimeFromDate(DateTime time) {
  return DateFormat.MEd().format(time);
}

extension ToJson on DateTime {


  String toJson() {
    final DateFormat _dateFormatter = DateFormat(serverDateFormat);

    return _dateFormatter.format(this);
  }
}
