String? validateName(String? text, {String? label, bool optional = false}) {
  if (text == null || text.trim().isEmpty) {
    return optional ? null : '${label ?? "This field"} can\'t be empty';
  }
  return null;
}

String? validateEmail(String? email, {bool optional = false}) {
  if (email == null || email.trim().isEmpty) {
    return optional ? null : 'Email can\'t be empty';
  }
  final regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z]+\.[a-zA-Z]+");
  final isValidEmail = regex.hasMatch(email);
  if (!isValidEmail) return 'Invalid Email';
  return null;
}

String? validatePassword(String? password) {
  if (password == null || password.trim().isEmpty) {
    return 'Password can\'t be empty';
  }
  if (password.length < 8) {
    return 'Password should contain at least 8 characters';
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
