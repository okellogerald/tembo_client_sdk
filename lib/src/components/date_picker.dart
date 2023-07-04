import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tembo_client/src/extensions/source.dart';

import '../styles/button_styles.dart';
import 'text.dart';
import 'text_button.dart';

class TemboDatePicker extends StatefulWidget {
  final DateTime? value;
  final ValueChanged<DateTime> onSelected;
  final String? hint;
  final bool active, dobPicker;
  final TemboButtonStyle? style;

  const TemboDatePicker({
    super.key,
    this.value,
    required this.onSelected,
    this.hint,
    this.active = true,
    this.dobPicker = false,
    this.style,
  });

  @override
  State<TemboDatePicker> createState() => _TemboDatePickerState();
}

class _TemboDatePickerState extends State<TemboDatePicker> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.value;
  }

  onSelected(DateTime date) {
    selectedDate = date;
    widget.onSelected(date);
    setState(() {});
  }

  @override
  void didUpdateWidget(TemboDatePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    selectedDate = widget.value;
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
    return TemboTextButton(
      onPressed: () {
        if (widget.active) showPicker();
      },
      style: widget.style ??
          TemboButtonStyle(
            backgroundColor: Colors.transparent,
            foregroundColor: context.colorScheme.onBackground,
            height: 45,
            borderWidth: 2,
            borderColor: context.colorScheme.surface,
            borderRadius: 10,
          ),
      child: Row(
        children: [
          Expanded(
            child: TemboText(
              selectedDate != null
                  ? DateFormat("dd/MM/yyyy").format(selectedDate!)
                  : widget.hint ?? "",
            ),
          ),
          const SizedBox(width: 10),
          Icon(
            Icons.calendar_today_outlined,
            color: context.colorScheme.onSurface,
            size: 20,
          )
        ],
      ),
    );
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
}
