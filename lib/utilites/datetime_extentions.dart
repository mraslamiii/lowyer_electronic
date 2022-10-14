import 'package:intl/intl.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

const String dateFormat = "yyyy-MM-dd HH:mm:ss";
const String serverDateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ";
final formatter = NumberFormat("#,###");

String getDate(Jalali time) {
  final DateFormatter formatter = time.formatter;
  return '${formatter.yyyy}/${formatter.mm}/${formatter.dd}';
}

String numberFormatter(int number) {
  var formatter = NumberFormat('#,#### 0000');
  return formatter.format(number).replaceAll(',', '  ');
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
    final DateFormat dateFormatter = DateFormat(serverDateFormat);

    return dateFormatter.format(this);
  }
}
