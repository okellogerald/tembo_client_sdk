import 'package:flutter/material.dart';
import 'package:tembo_client_sdk/src/components/source.dart';
import 'package:tembo_client_sdk/src/constants/colors.dart';
import 'package:tembo_client_sdk/src/constants/constants.dart';
import 'package:tembo_client_sdk/src/extensions/source.dart';
import 'package:tembo_client_sdk/src/styles/box_decoration.dart';

/// Widget for showing a validation error
class ValidationErrorView extends StatelessWidget {
  final String? error;
  const ValidationErrorView({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    if (error?.isEmpty ?? true) return Container();

    return Container(
      decoration: TemboBoxDecoration(
        borderColor: LightTemboColors.error.withOpacity(.2),
        borderWidth: 2,
        color: LightTemboColors.error.withOpacity(.05),
      ),
      padding: kHorPadding.copyWith(top: 20, bottom: 20),
      child: TemboText(
        error!,
        style: context.textTheme.bodyMedium.withFW500.withColor(
          LightTemboColors.error,
        ),
      ),
    );
  }
}
