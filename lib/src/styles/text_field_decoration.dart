import 'package:flutter/material.dart';
import 'package:tembo_client/src/extensions/source.dart';

import '../constants/colors.dart';
import '../constants/styles.dart';

enum TemboBorderStyle { underline, outline }

class TemboTextFieldDecoration {
  final Color? fillColor;
  final TextStyle hintStyle;
  final TextStyle? labelStyle;
  final String? hint, label;
  final double? borderWidth;
  final double? borderRadius;
  final Color? borderColor;
  final bool hasBorder;
  final Size? size;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TemboBorderStyle? borderStyle;
  final EdgeInsets? padding;
  final bool useDefinedStylesForDisabledBorder;

  const TemboTextFieldDecoration({
    this.fillColor,
    this.hintStyle = const TextStyle(
      color: TemboColors.onSurface,
      fontWeight: FontWeight.w400,
      fontSize: 15,
    ),
    this.hint,
    this.label,
    this.labelStyle,
    this.borderWidth,
    this.borderRadius,
    this.borderColor,
    this.hasBorder = true,
    this.size,
    this.prefixIcon,
    this.suffixIcon,
    this.borderStyle = TemboBorderStyle.outline,
    this.padding,
    this.useDefinedStylesForDisabledBorder = false,
  });

  TextStyle get valueStyle => hintStyle.withColor(TemboColors.onBackground);

  TemboTextFieldDecoration copyWith({
    Color? fillColor,
    String? hint,
    Widget? suffixIcon,
  }) {
    return TemboTextFieldDecoration(
      fillColor: fillColor ?? this.fillColor,
      hint: hint ?? this.hint,
      hintStyle: hintStyle,
      borderColor: borderColor,
      borderRadius: borderRadius,
      borderWidth: borderWidth,
      hasBorder: hasBorder,
      size: size,
      prefixIcon: prefixIcon,
      label: label,
      labelStyle: labelStyle,
      borderStyle: borderStyle,
      padding: padding,
      suffixIcon: suffixIcon ?? this.suffixIcon,
    );
  }

  InputBorder get disabledBorder {
    if(useDefinedStylesForDisabledBorder) {
      return  OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor ?? Colors.transparent,
        width: borderWidth ?? 0,
      ),
    );
    }
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: TemboColors.surface,
        width: 2,
      ),
    );
  }

  InputBorder get border {
    return hasBorder
        ? borderStyle == TemboBorderStyle.outline
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? kBorderRadius),
                borderSide: BorderSide(
                  color: borderColor ?? TemboColors.onSurface,
                  width: borderWidth ?? 1.5,
                ),
              )
            : UnderlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? kBorderRadius),
                borderSide: BorderSide(
                  color: borderColor ?? TemboColors.background,
                  width: borderWidth ?? 1.0,
                ),
              )
        : disabledBorder;
  }

  InputDecoration get getInputDecoration {
    final decoration = InputDecoration(
      isDense: false,
      border: border,
      enabledBorder: border,
      focusedBorder: border,
      errorBorder: border.copyWith(
        borderSide: BorderSide(
          color: TemboColors.error,
          width: border.borderSide.width,
        ),
      ),
      disabledBorder: disabledBorder,
      filled: fillColor != null,
      fillColor: fillColor,
      contentPadding: padding ?? const EdgeInsets.fromLTRB(12, 0, 12, 0),
      hintStyle: hintStyle,
      hintText: hint,
      label: label == null ? null : Text(label!, style: labelStyle),
    );
    if (prefixIcon != null) return decoration.copyWith(prefixIcon: prefixIcon);
    if (suffixIcon != null) return decoration.copyWith(suffixIcon: suffixIcon);
    return decoration;
  }
}
