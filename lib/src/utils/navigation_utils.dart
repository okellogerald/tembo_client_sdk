import 'package:flutter/material.dart';

import '../components/loading_indicator.dart';
import '../components/snack_bar.dart';

final rootNavigator = GlobalKey<NavigatorState>();

final rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

Future push(
  BuildContext context, {
  required Widget page,
  required String routeName,
}) async {
  final navigatorState = _getNavigatorInstance(context);
  return await navigatorState?.push(MaterialPageRoute(
    builder: (_) => page,
    settings: RouteSettings(name: routeName),
  ));
}

void pop(context, [result]) {
  final navigatorState = _getNavigatorInstance(context);
  navigatorState?.pop(result);
}

void popUntil(BuildContext context, {required String routeName}) {
  final navigatorState = _getNavigatorInstance(context);
  navigatorState?.popUntil((route) => route.settings.name == routeName);
}

void pushAndRemoveUntil(BuildContext context, {required Widget page}) {
  final navigatorState = _getNavigatorInstance(context);
  navigatorState?.pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => page), (route) => false);
}

void showLoadingMaterialBanner([String? message]) {
  rootScaffoldMessengerKey.currentState!.clearMaterialBanners();
  rootScaffoldMessengerKey.currentState!.showMaterialBanner(
    MaterialBanner(
      content: Text(message ?? "Loading..."),
      actions: const [TemboLoadingIndicator(), SizedBox(width: 10)],
    ),
  );
}

NavigatorState? _getNavigatorInstance(BuildContext context,
    [bool useRootNavigator = false]) {
  late NavigatorState? navigatorState;
  if (!useRootNavigator) {
    navigatorState = Navigator.of(context);
  } else {
    navigatorState = rootNavigator.currentState!;
  }
  return navigatorState;
}

showSnackbar(
  BuildContext context,
  String message, {
  bool isError = true,
  int? duration,
}) {
  ScaffoldMessenger.of(context).showSnackBar(TemboSnackbar(
    message,
    isError,
    durationInSeconds: duration,
  ));
}

showErrorSnackbar(BuildContext context, String message, [int? duration]) {
  showSnackbar(
    context,
    message,
    isError: true,
    duration: duration,
  );
}

showInfoSnackbar(BuildContext context, String message) => showSnackbar(
      context,
      message,
      isError: false,
    );
