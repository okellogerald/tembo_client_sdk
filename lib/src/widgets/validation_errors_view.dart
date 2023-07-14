import 'package:flutter/material.dart';
import 'package:tembo_client/src/components/exports.dart';
import 'package:tembo_client/src/constants/colors.dart';
import 'package:tembo_client/src/constants/constants.dart';
import 'package:tembo_client/src/extensions/source.dart';
import 'package:tembo_client/src/styles/box_decoration.dart';
import 'package:tembo_client/src/styles/button_styles.dart';

class ValidationErrorsView extends StatelessWidget {
  final List<String> errors;
  const ValidationErrorsView({super.key, required this.errors});

  @override
  Widget build(BuildContext context) {
    if (errors.isEmpty) return Container();

    return Container(
      decoration: TemboBoxDecoration(
        borderColor: TemboColors.error.withOpacity(.2),
        borderWidth: 2,
        color: TemboColors.error.withOpacity(.05),
      ),
      padding: kHorPadding.copyWith(top: 20, bottom: 20),
      constraints: const BoxConstraints(minHeight: 80),
      child: /*Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          errors.length,
          (index) {
          
          },
        ),
      ),*/

          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TemboText(
            "Please fix below error(s):",
            style: context.textTheme.bodyLarge.withFW400.withColor(
              Colors.black54,
            ),
          ),
          const SizedBox(height: 10),
          ListView.separated(
            itemBuilder: (_, i) {
              return TemboText(
                "- ${errors[i]}",
                style: context.textTheme.bodyMedium.withFW500.withColor(
                  TemboColors.error,
                ),
              );
            },
            separatorBuilder: (_, i) => const SizedBox(height: 10),
            itemCount: errors.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ),
          const SizedBox(height: 30),
          TemboTextButton(
            onPressed: () {},
            style: const TemboButtonStyle.outline(
              height: 35,
              width: 100,
            ),
            child: const TemboText("Okay"),
          )
        ],
      ),
    );
  }
}