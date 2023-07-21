import 'package:flutter/material.dart';
import 'package:tembo_client_sdk/tembo_client_sdk.dart';

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
    return SafeArea(
      child: TemboTextButton(
        onPressed: callback,
        style: theme.bottomNavBarButtonStyle,
        child: TemboText(text ?? "Next"),
      ),
    );
  }
}
