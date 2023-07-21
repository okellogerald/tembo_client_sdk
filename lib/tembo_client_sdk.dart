library tembo_client_sdk;

import 'package:flutter/material.dart';
import 'package:tembo_client_sdk/src/constants/colors.dart';
import 'package:tembo_client_sdk/src/constants/theme_data.dart';
import 'package:tembo_client_sdk/src/utils/navigation_utils.dart';
import 'package:tembo_client_sdk/src/view_models/data_manager.dart';
import 'package:tembo_client_sdk/src/views/country_pick_page.dart';

import 'src/models/data.dart';

export 'src/views/basic_info_page.dart';
export 'src/constants/source.dart';
export 'src/styles/source.dart';

late final TemboThemeData theme;
late final DataManager dataManager;

void startTemboVerification(
  BuildContext context, {
  TemboThemeData? themeData,
  TemboColorScheme? colorScheme,
  required String userId,
  Map<String, dynamic>? otherValues,
  String? fontFamily,
}) {
  _initThemeData(
    themeData: themeData,
    scheme: colorScheme,
    fontFamily: fontFamily,
  );
  _initDataManager(userId: userId, otherValues: otherValues);

  push(
    context,
    page: DefaultTextStyle(
      style: TextStyle(
        fontFamily: fontFamily,
      ),
      child: Scaffold(
        key: rootScaffoldMessengerKey,
        body: ValueListenableBuilder<Data>(
            valueListenable: dataManager,
            builder: (context, _, snapshot) {
              return const CountryPickPage();
            }),
      ),
    ),
  );
}

void _initThemeData({
  TemboThemeData? themeData,
  TemboColorScheme? scheme,
  String? fontFamily,
}) {
  late TemboThemeData data;
  try {
    if (themeData != null) {
      data = themeData;
    } else {
      if (scheme == null) {
        data = TemboThemeData();
      } else {
        data = TemboThemeData.from(scheme);
      }
    }
    if (fontFamily != null) theme = handleFontFamily(data, fontFamily);
    if (fontFamily == null) theme = data;
  } catch (_) {
    // handling LateInitializationError issues
  }
}

void _initDataManager({
  required String userId,
  required Map<String, dynamic>? otherValues,
}) {
  final data = Data(userId: userId, otherValues: otherValues);
  try {
    dataManager = DataManager(data);
  } catch (_) {
    // handling LateInitializationError issues
    dataManager.updateData(data);
  }
}
