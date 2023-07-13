import 'package:flutter/material.dart';

import '../styles/source.dart';
import 'exports.dart';

class BottomNavBarButton extends StatelessWidget {
  final VoidCallback callback;
  final String? text;
  const BottomNavBarButton({
    super.key,
    required this.callback,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TemboTextButton(
        onPressed: callback,
        style: const TemboButtonStyle.filled(height: 60),
        child: TemboText(text ?? "Next"),
      ),
    );
  }
}
