import 'package:flutter/material.dart';

class TemboColors {
  static const primary = Color(0xff04448B);
  static const onPrimary = Colors.white;

  static const border = Colors.black45;
  static const hint = Colors.black54;
  static const title = Color(0xffAAC0CE);

  static const background = Colors.white;
  static const onBackground = Colors.black87;

  static const surfaceContainer = Color(0xffF0F8FF);
  static const onSurfaceContainer = Colors.black54;

  static const error = Color(0xff841617);
  static const onError = Colors.white;
}

class TemboColorScheme { 
  final Color? primary,
      onPrimary,
      border,
      hint,
      title,
      background,
      onBackground,
      surfaceContainer,
      onSurfaceContainer,
      error,
      onError;

  const TemboColorScheme({
    this.primary,
    this.onPrimary,
    this.border,
    this.hint,
    this.title,
    this.background,
    this.onBackground,
    this.surfaceContainer,
    this.onSurfaceContainer,
    this.error,
    this.onError,
  });
}
