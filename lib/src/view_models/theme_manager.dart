import 'package:flutter/material.dart';

import '../constants/themes/theme_data.dart';

class ThemeManager extends ValueNotifier<TemboThemeData> {
  ThemeManager(super.data);

  void updateTheme(TemboThemeData data) {
    value = data;
    notifyListeners();
  }
}
