import 'package:intl/intl.dart';

extension StringExt on String {
  DateTime parseWith(String pattern) {
    return DateFormat(pattern).parse(pattern);
  }

  DateTime parse() {
    if (contains("T")) {
      return DateFormat("yyyy-MM-ddThh:mm:ss").parse(this, true).toLocal();
    }
    return DateFormat("yyyy-MM-dd hh:mm:ss").parse(this, true).toLocal();
  }
}

extension DateTimeExt on DateTime {
  String format({String? pattern}) {
    return DateFormat(pattern ?? "yyyy-MM-dd").format(this);
  }

  int get timestamp {
    return toUtc().millisecondsSinceEpoch;
  }
}
