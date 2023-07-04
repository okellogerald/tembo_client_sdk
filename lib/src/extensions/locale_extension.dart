import 'dart:convert';

import 'package:flutter/material.dart';

extension LocaleExt on Locale {
  bool get _isTZ => countryCode == "TZ";
  // bool get _isUK => countryCode == "UK";

  String get flag => _isTZ ? "🇹🇿" : "🇬🇧";
  String get language => _isTZ ? "Swahili" : "English";

  String toJson() {
    final map = {
      "country_code": countryCode,
      "lang_code": languageCode,
    };
    return jsonEncode(map);
  }
}
