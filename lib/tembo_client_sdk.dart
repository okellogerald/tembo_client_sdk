library tembo_client_sdk;

import 'package:tembo_client_sdk/src/view_models/locale_manager.dart';
import 'package:tembo_client_sdk/src/view_models/theme_manager.dart';
import 'package:tembo_client_sdk/src/views/source.dart';

import 'src/views/toc_page.dart';

export 'src/views/basic_info_page.dart';
export 'src/constants/source.dart';
export 'src/styles/source.dart';
export 'src/models/source.dart';

late final ThemeManager themeManager;
late final DataManager dataManager;
late final LocaleManager localeManager;

void startTemboVerification(
  BuildContext context, {
  required Data userData,
  TemboThemeData? themeData,
  TemboColorScheme? colorScheme,
  String? fontFamily,
  TemboLocale locale = TemboLocale.en,
}) {
  assert(!(colorScheme != null && themeData != null), "You can only specify either themeData or colorScheme but not both");

  final data = _initThemeData(
    themeData: themeData,
    scheme: colorScheme,
    fontFamily: fontFamily,
  );
  _initThemeManager(data);
  _initDataManager(userData);
  _initLocaleManager(locale);

  push(
    context,
    routeName: TOCPage.routeName,
    page: const TOCPage(),
  );
}

TemboThemeData _initThemeData({
  TemboThemeData? themeData,
  TemboColorScheme? scheme,
  String? fontFamily,
}) {
  var data = const TemboThemeData();

  if (themeData != null) {
    data = themeData;
  }

  if (scheme != null) {
    data = TemboThemeData.from(scheme);
  }

  final family = themeData?.fontFamily ?? fontFamily;
  if (family != null) {
    data = data.copyWith(fontFamily: family);
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

void _initLocaleManager(TemboLocale locale) {
  try {
    localeManager = LocaleManager(locale);
  } catch (_) {
    // handling LateInitializationError issues
    localeManager.updateLocale(locale);
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
