import 'package:flutter/material.dart';

import '../constants/colors.dart';

extension TextStyleExtension on TextStyle? {
  TextStyle get withPrimaryColor =>
      this!.copyWith(color: LightTemboColors.primary);

  TextStyle get withOnPrimaryColor =>
      this!.copyWith(color: LightTemboColors.onPrimary);

  TextStyle get withFW300 => this!.copyWith(fontWeight: FontWeight.w300);
  TextStyle get withFW400 => this!.copyWith(fontWeight: FontWeight.w400);
  TextStyle get withFW500 => this!.copyWith(fontWeight: FontWeight.w500);
  TextStyle get withFW600 => this!.copyWith(fontWeight: FontWeight.w600);
  TextStyle get withFW700 => this!.copyWith(fontWeight: FontWeight.w700);

  TextStyle? withSize(num size) => this?.copyWith(
        fontSize: size.toDouble(),
      );

  TextStyle withColor(Color? color) => this!.copyWith(color: color);

  TextStyle withHexColor(int color) => this!.copyWith(color: Color(color));

  TextStyle withColorConditional(Color? color, bool canApply) => this!.copyWith(
        color: canApply ? color : null,
      );

  TextStyle withPrimaryColorIf(bool canApply) => this!.copyWith(
        color: canApply ? LightTemboColors.primary : null,
      );
}
