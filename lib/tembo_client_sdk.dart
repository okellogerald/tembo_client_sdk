library tembo_client_sdk;

import 'package:smile_identity_plugin/models/smile_data.dart';
import 'package:tembo_client_sdk/src/view_models/fields_manager.dart';
import 'package:tembo_client_sdk/src/view_models/locale_manager.dart';
import 'package:tembo_client_sdk/src/view_models/theme_manager.dart';
import 'package:tembo_client_sdk/src/views/data_verify_page.dart';
import 'package:tembo_client_sdk/src/views/source.dart';

import 'src/views/toc_page.dart';

export 'src/views/basic_info_page.dart';
export 'src/constants/source.dart';
export 'src/styles/source.dart';
export 'src/models/source.dart';

late final ThemeManager themeManager;
late final DataManager dataManager;
late final LocaleManager localeManager;
late final UnModifiableFieldsManager fieldsManager;

var _environment = Environment.test;
Environment get environment => _environment;

/// Initiates the verification process
void startTemboVerification(
  /// The context of the widget from which the process starts. It is on this context's page
  /// where the app will return to once the whole process is done.
  BuildContext context, {
  /// Defined user data will be pre-filled in respective pages of the SDK. Set [skipUserInfoCollection]
  /// to true if you want the user to be start documents verification immediately. Please keep in mind
  /// that this will only happen if all [TemboUserData] properties are given proper values.
  required TemboUserData userData,

  /// Color scheme to be used for all components used in the SDK.
  ///
  /// If [scheme] is not provided, the SDK checks for current system ThemeMode then
  /// the default respective [TemboColorScheme]s will be used:
  ///
  /// [TemboColorScheme.light] for ThemeMode.light and
  /// [TemboColorScheme.dark] for ThemeMode.dark
  TemboColorScheme? scheme,

  /// Font family to be used for all texts in the SDK
  String? fontFamily,

  /// Sets the language to be used.
  ///
  /// Only Swahili(sw) and English(en) are currently supported
  TemboLocale locale = TemboLocale.en,

  /// Make sure to use Environment.prod before you push to production.
  Environment? environment,

  /// If set to true and all [TemboUserData] properties are given proper values makes the user start
  /// documents verification immediately
  bool? skipUserInfoCollection,

  /// A list of unmodifiable lists
  Fields unmodifiableFields = const [],
}) {
  final themeData = _initThemeData(context, scheme, fontFamily);
  _initThemeManager(themeData);
  _initDataManager(userData);
  _initLocaleManager(locale);
  _initFieldsManager(unmodifiableFields);
  _environment = environment ?? Environment.test;

  if (skipUserInfoCollection == true &&
      dataManager.checkIfHasAllImportantFields()) {
    push(
      context,
      routeName: DataVerifyPage.routeName,
      page: const DataVerifyPage(),
    );
  } else {
    push(
      context,
      routeName: TOCPage.routeName,
      page: const TOCPage(),
    );
  }
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

void _initDataManager(TemboUserData userData) {
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

void _initFieldsManager(Fields fields) {
  try {
    fieldsManager = UnModifiableFieldsManager(fields);
  } catch (_) {
    // handling LateInitializationError issues
    fieldsManager.updateList(fields);
  }
}
