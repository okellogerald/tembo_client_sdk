import 'package:tembo_client_sdk/tembo_client_sdk.dart';

String? validateName(String? text, {String? label, bool optional = false}) {
  if (text == null || text.trim().isEmpty) {
    return optional
        ? null
        : '${label != null ? "$label:" : TemboTexts.errorsEmptyFieldsPrefix.tr()} ${TemboTexts.errorsEmptyFieldsSuffix.tr()}';
  }
  return null;
}

// Returns true if two dates are equal
bool compareDates(DateTime? date1, DateTime? date2) {
  if (date1 == null || date2 == null) return false;
  final i = date1.toLocal().millisecondsSinceEpoch;
  final j = date2.toLocal().millisecondsSinceEpoch;
  return i == j;
}

bool checkIfOnSameDay(DateTime? date1, DateTime? date2) {
  if (date1 == null || date2 == null) return false;
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}
