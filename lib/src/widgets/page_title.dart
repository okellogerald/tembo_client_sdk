import 'package:flutter/material.dart';
import 'package:tembo_client_sdk/src/components/text.dart';

import 'source.dart';

class PageTitle extends StatelessWidget {
  final String title;
  const PageTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ThemeDataWrapper(
      builder: (context, theme) {
        return TemboText(
          title,
          style: theme.pageTitleStyle,
        );
      },
    );
  }
}
