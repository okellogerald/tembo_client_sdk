import 'package:flutter/material.dart';
import 'package:tembo_client_sdk/src/widgets/theme_data_wrapper.dart';

import 'source.dart';

class TemboRadioButton<T> extends StatelessWidget {
  final ValueChanged<T> onPressed;
  final bool Function(T value) selected;
  final String Function(T value) label;
  final T value;
  final bool enabled;

  const TemboRadioButton({
    super.key,
    required this.onPressed,
    required this.selected,
    required this.label,
    required this.value,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final selectedValue = selected(value);
    return ThemeDataWrapper(
      builder: (context, theme) {
        return TemboTextButton(
          onPressed: enabled ? () => onPressed(value) : () {},
          style: selectedValue
              ? theme.selectedOptionButtonStyle
              : theme.unselectedOptionButtonStyle,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (selectedValue)
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.check, size: 20),
                ),
              TemboText(label(value)),
            ],
          ),
        );
      },
    );
  }
}
