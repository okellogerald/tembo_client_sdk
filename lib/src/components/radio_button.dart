import 'package:flutter/material.dart';
import 'package:tembo_client/src/constants/styles.dart';
import 'package:tembo_client/src/extensions/source.dart';

import '../styles/source.dart';
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
      style: TemboButtonStyle(
        height: 45,
        backgroundColor: Colors.grey.shade200,
        borderRadius: kBorderRadius,
        borderColor:
            selectedValue ? context.colorScheme.primary : Colors.black54,
        borderWidth: selectedValue ? 2.0 : 0.0,
        foregroundColor: selectedValue
            ? context.colorScheme.primary
            : context.colorScheme.onSurface,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        textStyle: context.textTheme.bodyMedium!.copyWith(
          fontWeight: selectedValue ? FontWeight.bold : FontWeight.normal,
        ),
      ),
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
