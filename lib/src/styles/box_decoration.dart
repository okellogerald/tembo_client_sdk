import 'package:flutter/material.dart';

class TemboBoxDecoration extends BoxDecoration {
  final double? radius;
  final double? borderWidth;
  final Color? borderColor;

  const TemboBoxDecoration({
    this.radius,
    this.borderWidth,
    this.borderColor,
    super.color,
    super.shape,
  });

  @override
  BorderRadiusGeometry? get borderRadius =>
      shape == BoxShape.circle ? null : BorderRadius.circular(radius ?? 5);

  @override
  BoxBorder? get border => borderColor == null && borderWidth == null
      ? null
      : Border.all(
          color: borderColor ?? Colors.black,
          width: borderWidth ?? 1,
        );
}
