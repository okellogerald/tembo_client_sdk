import 'package:flutter/material.dart';
import 'package:tembo_client_sdk/src/components/text.dart';
import 'package:tembo_client_sdk/src/constants/constants.dart';
import 'package:tembo_client_sdk/src/widgets/theme_data_wrapper.dart';
import 'package:tembo_client_sdk/tembo_client_sdk.dart';

class TemboLabelledFormField extends StatelessWidget {
  final String label;
  final String value;

  const TemboLabelledFormField({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeDataWrapper(builder: (context, theme) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TemboText(
            label,
            style: theme.labelledFormFieldDecoration?.labelTextStyle,
          ),
          const SizedBox(height: 5),
          Container(
            width: double.maxFinite,
            decoration: theme.labelledFormFieldDecoration?.boxDecoration,
            padding: kHorPadding.copyWith(top: 12, bottom: 12),
            alignment: Alignment.centerLeft,
            child: TemboText(
              value,
              style: theme.labelledFormFieldDecoration?.valueTextStyle,
            ),
          ),
        ],
      );
    });
  }
}
