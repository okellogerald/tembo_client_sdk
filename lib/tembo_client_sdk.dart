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
  TemboColorScheme? scheme,
  String? fontFamily,
  TemboLocale locale = TemboLocale.en,
}) {
  final data = _initThemeData(context, scheme, fontFamily);
  _initThemeManager(data);
  _initDataManager(userData);
  _initLocaleManager(locale);

  push(
    context,
    routeName: TOCPage.routeName,
    page: const TOCPage(),
  );
}

TemboThemeData _initThemeData(
  BuildContext context,
  TemboColorScheme? scheme,
  String? fontFamily,
) {
  TemboThemeData data;

  if (scheme == null) {
    var brightness = MediaQuery.platformBrightnessOf(context);
    bool isDarkMode = brightness == Brightness.dark;
    if (isDarkMode) {
      data = TemboThemeData.from(const TemboColorScheme.dark());
    } else {
      data = const TemboThemeData();
    }
  } else {
    data = TemboThemeData.from(scheme);
  }

  return data.copyWith(fontFamily: fontFamily);
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
