import 'package:flutter/material.dart';
import 'package:tembo_client/src/components/exports.dart';
import 'package:tembo_client/src/constants/colors.dart';
import 'package:tembo_client/src/constants/constants.dart';
import 'package:tembo_client/src/extensions/source.dart';
import 'package:tembo_client/src/styles/box_decoration.dart';

class ValidationErrorView extends StatelessWidget {
  final String? error;
  const ValidationErrorView({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    if (error?.isEmpty ?? true) return Container();

    return Container(
      decoration: TemboBoxDecoration(
        borderColor: TemboColors.error.withOpacity(.2),
        borderWidth: 2,
        color: TemboColors.error.withOpacity(.05),
      ),
      padding: kHorPadding.copyWith(top: 20, bottom: 20),
      child: TemboText(
        error!,
        style: context.textTheme.bodyMedium.withFW500.withColor(
          TemboColors.error,
        ),
      ),
    );
  }
}
