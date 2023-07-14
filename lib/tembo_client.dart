library tembo_client;

import 'package:flutter/material.dart';
import 'package:tembo_client/src/constants/theme_data.dart';
import 'package:tembo_client/src/utils/navigation_utils.dart';
import 'package:tembo_client/src/view_models/data_manager.dart';
import 'package:tembo_client/src/views/country_pick_page.dart';

import 'src/models/data.dart';

export 'src/views/basic_info_page.dart';

var theme = TemboThemeData();

final dataManager = DataManager();

void startTemboVerification(
  BuildContext context, {
  TemboThemeData? themeData,
}) {
  if (themeData != null) theme = themeData;

  push(
    context,
    page: Scaffold(
      key: rootScaffoldMessengerKey,
      body: ValueListenableBuilder<Data>(
          valueListenable: dataManager,
          builder: (context, _, snapshot) {
            return const CountryPickPage();
          }),
    ),
  );
}
