// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TemboColors {
  static const primary = Color(0xff04448B);
  static const onPrimary = Colors.white;

  static const border = Colors.black45;

  static const primaryContainer = Color(0xffECF5FC);
  static const onPrimaryContainer = Color(0xffAAC0CE);

  static const background = Colors.white;
  static const onBackground = Colors.black87;

  static const surface = Color(0xFFEEEEEE);
  static const onSurface = Color.fromARGB(255, 93, 93, 93);

  static const surfaceContainer = Color.fromARGB(255, 245, 245, 245);
  static const onSurfaceContainer = onSurface;

  static const error = Color(0xff841617);
  static const onError = Colors.white;
}

class TemboColors1 {
  final Color? primary,
      onPrimary,
      border,
      primaryContainer,
      onPrimaryContainer,
      background,
      onBackground,
      surface,
      onSurface,
      surfaceContainer,
      onSurfaceContainer,
      error,
      onError;

  const TemboColors1({
    this.primary,
    this.onPrimary,
    this.border,
    this.primaryContainer,
    this.onPrimaryContainer,
    this.background,
    this.onBackground,
    this.surface,
    this.onSurface,
    this.surfaceContainer,
    this.onSurfaceContainer,
    this.error,
    this.onError,
  });
}
