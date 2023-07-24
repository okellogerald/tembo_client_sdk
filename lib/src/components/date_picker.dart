import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tembo_client_sdk/src/extensions/source.dart';

import 'package:tembo_client_sdk/tembo_client_sdk.dart';

import '../widgets/theme_data_wrapper.dart';
import 'text.dart';
import 'text_button.dart';

class TemboDatePicker extends StatefulWidget {
  final DateTime? value;
  final ValueChanged<DateTime> onSelected;
  final bool active, dobPicker;
  final String? hint;
  final String? error;

  const TemboDatePicker({
    super.key,
    this.value,
    required this.onSelected,
    this.active = true,
    this.dobPicker = false,
    this.hint,
    this.error,
  });

  @override
  State<TemboDatePicker> createState() => _TemboDatePickerState();
}

class _TemboDatePickerState extends TemboState<TemboDatePicker> {
  DateTime? selectedDate;
  final _errorNotifier = ValueNotifier(false);

  void updateState() {
    selectedDate = widget.value;
    _errorNotifier.value = widget.error != null;
    setState(() {});
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    updateState();
  }

  onSelected(DateTime date) {
    selectedDate = date;
    widget.onSelected(date);
    setState(() {});
  }

  @override
  void didUpdateWidget(TemboDatePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateState();
  }

  showPicker() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      showAndroidPicker(context, onSelected);
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      showIOSPicker(context, onSelected);
    } else {
      showAndroidPicker(context, onSelected);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ThemeDataWrapper(builder: (context, theme) {
      final decoration = theme.datePickerDecoration?.copyWith(
        hint: widget.hint,
      );

      return ValueListenableBuilder(
          valueListenable: _errorNotifier,
          builder: (_, hasError, __) {
            final buttonStyle = decoration?.buttonStyle?.copyWith(
              borderColor: hasError ? TemboColors.error : null,
            );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TemboTextButton(
                  onPressed: () {
                    _errorNotifier.value = false;
                    if (widget.active) showPicker();
                  },
                  style: buttonStyle,
                  child: Row(
                    children: [
                      Expanded(
                        child: selectedDate != null
                            ? TemboText(
                                DateFormat("dd/MM/yyyy").format(selectedDate!),
                              )
                            : TemboText(
                                decoration?.hint ?? "",
                                style: decoration?.hintStyle,
                              ),
                      ),
                      const SizedBox(width: 10),
                      decoration?.icon ?? Container(),
                      /*     const Icon(
                              Icons.calendar_today_outlined,
                              size: 20,
                            ), */
                    ],
                  ),
                ),
                buildError(),
              ],
            );
          });
    });
  }

  showAndroidPicker(
    BuildContext context,
    ValueChanged<DateTime> onSelected,
  ) async {
    final selectedDate = widget.dobPicker
        ? await showDatePicker(
            context: context,
            currentDate: widget.value,
            firstDate: DateTime(1920),
            lastDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
            initialDate: DateTime(1980),
          )
        : await showDatePicker(
            context: context,
            currentDate: widget.value,
            firstDate: DateTime(1920),
            lastDate: DateTime(2100),
            initialDate: DateTime(1920),
          );

    if (selectedDate != null) onSelected(selectedDate);
  }

  showIOSPicker(BuildContext context, ValueChanged<DateTime> onSelected) {
    DateTime? date;

    showModalBottomSheet(
      context: context,
      constraints: const BoxConstraints.expand(height: 400),
      builder: (context) {
        return Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TemboText(
                    "Select Date",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        if (date != null) onSelected(date!);
                        Navigator.pop(context);
                      },
                      child: const TemboText(
                        "done",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ))
                ],
              ),
            ),
            widget.dobPicker
                ? Expanded(
                    child: CupertinoDatePicker(
                      initialDateTime: selectedDate,
                      minimumDate: DateTime(1920),
                      maximumDate: DateTime.now()
                          .subtract(const Duration(days: 365 * 18)),
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (value) => date = value,
                    ),
                  )
                : Expanded(
                    child: CupertinoDatePicker(
                      initialDateTime: selectedDate,
                      minimumDate: DateTime(1920),
                      maximumDate: DateTime(2100),
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (value) => date = value,
                    ),
                  ),
          ],
        );
      },
    );
  }

  Widget buildError() {
    return ValueListenableBuilder(
      valueListenable: _errorNotifier,
      builder: (_, hasError, __) {
        if (!hasError || widget.error == null) return Container();
        return Padding(
          padding: const EdgeInsets.only(top: 5),
          child: TemboText(
            widget.error!,
            style: context.textTheme.bodyMedium.withColor(
              TemboColors.error,
            ),
          ),
        );
      },
    );
  }
}
