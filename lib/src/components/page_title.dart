import 'package:flutter/material.dart';
import 'package:tembo_client/src/components/text.dart';
import 'package:tembo_client/tembo_client.dart';

class PageTitle extends StatelessWidget {
  final String title;
  const PageTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return TemboText(
      title,
      style: theme.pageTitleStyle,
    );
  }
}
