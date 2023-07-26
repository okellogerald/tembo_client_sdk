import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/constants.dart';

class TemboButtonStyle {
  final Color? backgroundColor, borderColor, foregroundColor;
  final num? elevation, width, height, borderWidth, borderRadius;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final bool? useContinuousBorder;

  const TemboButtonStyle({
    this.backgroundColor,
    this.borderColor,
    this.foregroundColor,
    this.borderWidth,
    this.borderRadius,
    this.elevation,
    this.width,
    this.padding = kHorPadding,
    this.height,
    this.textStyle,
    this.useContinuousBorder = false,
  });

  TextStyle? get getTextStyle => textStyle?.copyWith(
        color: foregroundColor,
      );

  const TemboButtonStyle.filled({
    this.backgroundColor = LightTemboColors.primary,
    this.foregroundColor = LightTemboColors.onPrimary,
    this.borderRadius,
    this.elevation,
    this.width,
    this.height,
    this.padding = kHorPadding,
    this.textStyle,
    this.useContinuousBorder = false,
  })  : borderColor = Colors.transparent,
        borderWidth = 0;

  const TemboButtonStyle.outline({
    this.foregroundColor = Colors.black,
    this.borderColor = Colors.black,
    this.borderWidth = 1.5,
    this.borderRadius = kBorderRadius,
    this.width,
    this.height,
    this.padding = kHorPadding,
    this.textStyle,
  })  : useContinuousBorder = false,
        elevation = 0,
        backgroundColor = Colors.transparent;

  const TemboButtonStyle.transparent({
    this.foregroundColor = Colors.black,
    this.width,
    this.height,
    this.padding = kHorPadding,
    this.textStyle,
  })  : borderRadius = null,
        useContinuousBorder = false,
        elevation = 0,
        backgroundColor = Colors.transparent,
        borderColor = Colors.transparent,
        borderWidth = 0;

  Size? get _size {
    if (width != null && height != null) {
      return Size(width!.toDouble(), height!.toDouble());
    }
    if (width != null && height == null) {
      return Size(width!.toDouble(), 45);
    }
    if (width == null && height != null) {
      return Size.fromHeight(height!.toDouble());
    }
    if (width == null && height == null) {
      return const Size.fromHeight(45);
    }
    return null;
  }

  TemboButtonStyle copyWith({
    Color? backgroundColor,
    Color? borderColor,
    Color? foregroundColor,
    num? elevation,
    num? width,
    num? height,
    num? borderWidth,
    num? borderRadius,
    EdgeInsets? padding,
    TextStyle? textStyle,
    bool? useContinuousBorder,
  }) {
    return TemboButtonStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      elevation: elevation ?? this.elevation,
      width: width ?? this.width,
      height: height ?? this.height,
      borderRadius: borderRadius ?? this.borderRadius,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      padding: padding ?? this.padding,
      textStyle: textStyle ?? this.textStyle,
      useContinuousBorder: useContinuousBorder ?? this.useContinuousBorder,
    );
  }

  TemboButtonStyle merge(TemboButtonStyle other) {
    return TemboButtonStyle(
      backgroundColor: other.backgroundColor ?? backgroundColor,
      elevation: other.elevation ?? elevation,
      width: other.width ?? width,
      height: other.height ?? height,
      borderRadius: other.borderRadius ?? borderRadius,
      foregroundColor: other.foregroundColor ?? foregroundColor,
      borderColor: other.borderColor ?? borderColor,
      borderWidth: other.borderWidth ?? borderWidth,
      padding: other.padding ?? padding,
      // textStyle: other.textStyle ?? textStyle,
      useContinuousBorder: other.useContinuousBorder ?? useContinuousBorder,
    );
  }

  TemboButtonStyle mergeWithColors({
    Color? backgroundColor,
    Color? borderColor,
    Color? foregroundColor,
  }) {
    return TemboButtonStyle(
      backgroundColor: this.backgroundColor ?? backgroundColor,
      foregroundColor: this.foregroundColor ?? foregroundColor,
      borderColor: this.borderColor ?? borderColor,

      elevation: elevation,
      width: width,
      height: height,
      borderRadius: borderRadius,
      borderWidth: borderWidth,
      padding: padding,
      // textStyle: other.textStyle ?? textStyle,
      useContinuousBorder: useContinuousBorder,
    );
  }

  bool get _usesContinuousBorder =>
      useContinuousBorder == null || useContinuousBorder == true;

  ButtonStyle get buttonStyle {
    return ElevatedButton.styleFrom(
      elevation: elevation?.toDouble() ?? 0,
      backgroundColor: backgroundColor,
      shape: _usesContinuousBorder
          ? ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(
                  borderRadius?.toDouble() ?? kBorderRadius),
              side: BorderSide(
                color: borderColor ?? Colors.grey,
                width: borderWidth?.toDouble() ?? 1.0,
              ),
            )
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  borderRadius?.toDouble() ?? kBorderRadius),
              side: BorderSide(
                color: borderColor ?? Colors.grey,
                width: borderWidth?.toDouble() ?? 1.0,
              ),
            ),
      textStyle: getTextStyle,
      fixedSize: _size,
      padding: padding,
    );
  }
}
