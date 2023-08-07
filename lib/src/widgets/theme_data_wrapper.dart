import 'package:flutter/material.dart';
import 'package:tembo_client_sdk/tembo_client_sdk.dart';

/// Exposes the most recent [TemboThemeData] instance
class ThemeDataWrapper extends StatelessWidget {
  final Widget Function(BuildContext context, TemboThemeData themeData) builder;
  const ThemeDataWrapper({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeManager,
      builder: (context, themeData, child) {
        return builder(context, themeData);
      },
    );
  }
}
