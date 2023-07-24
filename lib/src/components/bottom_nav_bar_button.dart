import 'package:flutter/material.dart';
import 'package:tembo_client_sdk/src/components/source.dart';

import '../widgets/theme_data_wrapper.dart';

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
      child: ThemeDataWrapper(
        builder: (context, theme) {
          return TemboTextButton(
            onPressed: callback,
            style: theme.bottomNavBarButtonStyle,
            child: TemboText(text ?? "Next"),
          );
        }
      ),
    );
  }
}
