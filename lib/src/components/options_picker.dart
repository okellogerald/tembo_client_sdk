import 'package:flutter/cupertino.dart';
import 'package:tembo_client/src/constants/styles.dart';
import 'package:tembo_client/src/extensions/source.dart';

import '../styles/source.dart';
import 'exports.dart';
import 'options_dialog.dart';

class TemboLabelledPicker<T> extends StatelessWidget {
  final T? value;
  final Iterable<T> options;
  final void Function(T value) onChange;
  final String Function(T value) name;
  final String title;
  final bool enabled;
  final TemboButtonStyle? style;

  const TemboLabelledPicker({
    Key? key,
    this.value,
    required this.options,
    required this.onChange,
    required this.name,
    required this.title,
    this.enabled = true,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TemboText(title),
        TemboTextButton(
          onPressed: () async {
            if (!enabled) return;
            final newType = await showOptionsDialog<T>(
              context: context,
              options: options.toList(),
              currentValue: value,
              dropdownTitle: title,
              nameGetter: name,
            );
            if (newType == null) return;
            onChange(newType);
          },
          style: style ??
              TemboButtonStyle(
                borderColor: context.colorScheme.surface,
                foregroundColor: context.colorScheme.onBackground,
                height: 45,
                borderWidth: 2,
                borderRadius: kBorderRadius,
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ignore: null_check_on_nullable_type_parameter
              value == null ? Container() : TemboText(name(value!)),
              const Icon(CupertinoIcons.chevron_down, size: 18),
            ],
          ),
        ),
      ],
    );
  }
}

class TemboPicker<T> extends StatelessWidget {
  final T? value;
  final Iterable<T> options;
  final void Function(T value) onChange;
  final String Function(T value) name;
  final String dropdownTitle;
  final bool enabled;
  final TemboButtonStyle? style;
  final Widget? trailingIcon;
  final String? hint;

  const TemboPicker({
    Key? key,
    this.value,
    required this.options,
    required this.onChange,
    required this.name,
    required this.dropdownTitle,
    this.enabled = true,
    this.trailingIcon,
    this.style,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemboTextButton(
      onPressed: () async {
        if (!enabled) return;
        final newType = await showOptionsDialog<T>(
          context: context,
          options: options.toList(),
          currentValue: value,
          dropdownTitle: dropdownTitle,
          nameGetter: name,
        );
        if (newType == null) return;
        onChange(newType);
      },
      style: style ??
          TemboButtonStyle(
            borderColor: context.colorScheme.surface,
            foregroundColor: context.colorScheme.onBackground,
            height: 45,
            borderWidth: 2,
            borderRadius: kBorderRadius,
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (hint != null && value == null) TemboText(hint!),
          // ignore: null_check_on_nullable_type_parameter
          value == null ? Container() : TemboText(name(value!)),
          if (trailingIcon != null)
            trailingIcon ?? const Icon(CupertinoIcons.chevron_down, size: 18),
        ],
      ),
    );
  }
}
