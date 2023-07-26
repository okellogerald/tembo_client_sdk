import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../styles/source.dart';
import 'source.dart';

class TemboOptionButton<T> extends StatelessWidget {
  final void Function(T option) onTap;
  final T option;
  final String Function(T option) name;
  final bool selected;

  const TemboOptionButton({
    super.key,
    required this.onTap,
    required this.option,
    required this.name,
    required this.selected,
  });

  TemboButtonStyle get unselectedStyle {
    return const TemboButtonStyle(
      backgroundColor: Colors.white,
      foregroundColor: LightTemboColors.onBackground,
      width: 250,
      height: 60,
      borderColor: LightTemboColors.border,
      padding: EdgeInsets.symmetric(horizontal: 30),
    );
  }

  TemboButtonStyle get selectedStyle {
    return unselectedStyle.copyWith(
      borderWidth: 1.5,
      borderColor: LightTemboColors.primary,
    );
  }

  @override
  Widget build(BuildContext context) {
    final style = selected ? selectedStyle : unselectedStyle;

    return TextButton(
      onPressed: () {
        onTap(option);
      },
      style: style.buttonStyle,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: TemboText(
                name(option),
                style: style.getTextStyle,
                maxLines: 2,
              ),
            ),
          ),
          if (selected) const Icon(Icons.check_circle)
        ],
      ),
    );
  }
}
