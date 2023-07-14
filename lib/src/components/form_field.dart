import 'package:flutter/material.dart';
import 'package:tembo_client/src/components/text.dart';
import 'package:tembo_client/src/constants/colors.dart';
import 'package:tembo_client/src/constants/constants.dart';
import 'package:tembo_client/src/extensions/source.dart';
import 'package:tembo_client/src/styles/box_decoration.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TemboText(
          label,
          style: context.textTheme.bodyMedium.withFW300.withColor(
            Colors.black54,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 45,
          width: double.maxFinite,
          decoration: TemboBoxDecoration(
            borderColor: TemboColors.border,
            borderWidth: 1.5,
            color: Colors.grey.shade100,
          ),
          padding: kHorPadding,
          alignment: Alignment.centerLeft,
          child: TemboText(
            value,
            style: context.textTheme.bodyMedium.withFW500,
          ),
        ),
      ],
    );
  }
}
