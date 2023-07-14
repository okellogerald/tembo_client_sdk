import 'package:flutter/material.dart';
import 'package:tembo_client/tembo_client.dart';

import 'exports.dart';

class TemboRadioButton<T> extends StatelessWidget {
  final ValueChanged<T> onPressed;
  final bool Function(T valur) selected;
  final String Function(T value) label;
  final T value;

  const TemboRadioButton({
    super.key,
    required this.onPressed,
    required this.selected,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final selectedValue = selected(value);
    return TemboTextButton(
      onPressed: () => onPressed(value),
      style: selectedValue
          ? theme.selectedOptionButtonStyle
          : theme.unselecetdOptionButtonStyle,
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
  }
}
