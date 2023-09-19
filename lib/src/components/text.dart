import 'package:flutter/material.dart';
import 'package:tembo_client_sdk/tembo_client_sdk.dart';

import '../widgets/theme_data_wrapper.dart';

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
    return ThemeDataWrapper(
      builder: (context, theme) {
        return ValueListenableBuilder(
            valueListenable: localeManager,
            builder: (context, locale, _) {
              final textStyle = (style ?? const TextStyle());
              return Text(
                (locale == TemboLocale.en ? enTexts[data] : swTexts[data]) ??
                    data,
                style: textStyle.copyWith(
                  fontFamily: theme.fontFamily,
                ),
                textAlign: textAlign,
                overflow: overflow,
                maxLines: maxLines,
                textScaleFactor: 1.0,
              );
            });
      },
    );
  }
}
