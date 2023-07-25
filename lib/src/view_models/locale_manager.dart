import 'package:flutter/material.dart';
import 'package:tembo_client_sdk/tembo_client_sdk.dart';

class LocaleManager extends ValueNotifier<TemboLocale> {
  LocaleManager(super.data);

  void updateLocale(TemboLocale locale) {
    value = locale;
    notifyListeners();
  }
}
