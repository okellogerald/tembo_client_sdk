library tembo_client_sdk;

import 'package:tembo_client_sdk/src/view_models/theme_manager.dart';
import 'package:tembo_client_sdk/src/views/country_pick_page.dart';
import 'package:tembo_client_sdk/src/views/source.dart';

export 'src/views/basic_info_page.dart';
export 'src/constants/source.dart';
export 'src/styles/source.dart';
export 'src/models/source.dart';

late final ThemeManager themeManager;
late final DataManager dataManager;

void startTemboVerification(
  BuildContext context, {
  required Data userData,
  TemboThemeData? themeData,
  TemboColorScheme? colorScheme,
  String? fontFamily,
}) {
  final data = _initThemeData(
    themeData: themeData,
    scheme: colorScheme,
    fontFamily: fontFamily,
  );
  _initThemeManager(data);
  _initDataManager(userData);

  push(
    context,
    routeName: CountryPickPage.routeName,
    page: const CountryPickPage(),
  );
}

TemboThemeData _initThemeData({
  TemboThemeData? themeData,
  TemboColorScheme? scheme,
  String? fontFamily,
}) {
  var data = TemboThemeData();
  try {
    if (themeData != null) {
      data = themeData;
    }
    if (scheme != null) {
      data = TemboThemeData.from(scheme);
    }
    final family = themeData?.fontFamily ?? fontFamily;
    if (family != null) {
      data = handleFontFamily(data, family);
    }
  } catch (_) {
    //
  }

  return data;
}

void _initDataManager(Data userData) {
  try {
    dataManager = DataManager(userData);
  } catch (_) {
    // handling LateInitializationError issues
    dataManager.updateData(userData);
  }
}

void _initThemeManager(TemboThemeData themeData) {
  try {
    themeManager = ThemeManager(themeData);
  } catch (_) {
    // handling LateInitializationError issues
    themeManager.updateTheme(themeData);
  }
}
