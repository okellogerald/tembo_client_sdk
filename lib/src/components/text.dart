import 'package:flutter/material.dart';

class TemboText extends StatelessWidget {
  const TemboText(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  final String data;

  final TextStyle? style;

  final TextAlign? textAlign;

  final TextOverflow? overflow;

  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Text(
        data,
        style: style,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        textScaleFactor: 1.0,
      );
    });
  }
}
