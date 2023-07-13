import 'package:flutter/widgets.dart';

import 'radio_button.dart';

class TemboPicker2<T> extends StatelessWidget {
  final List<T> options;
  final ValueChanged<T> onChange;
  final bool Function(T) selected;
  final String Function(T) label;

  const TemboPicker2({
    super.key,
    required this.options,
    required this.onChange,
    required this.selected,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      spacing: 10,
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      children: List.generate(
        options.length,
        (index) => TemboRadioButton(
          value: options[index],
          onPressed: onChange,
          selected: selected,
          label: label,
        ),
      ),
    );
  }
}
