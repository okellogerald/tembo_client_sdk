
import 'package:flutter/material.dart';
import 'package:tembo_client_sdk/src/constants/constants.dart';
import 'package:tembo_client_sdk/src/extensions/source.dart';

import 'source.dart';
import 'option_button.dart';

Future<T?> showOptionsDialog<T>({
  required BuildContext context,
  required List<T> options,
  required String dropdownTitle,
  T? currentValue,
  bool canSearch = false,
  required String Function(T option) nameGetter,
  Future<List<T>> Function()? future,
}) async {
  return await showDialog<T>(
    context: context,
    builder: (_) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      backgroundColor: Colors.white,
      child: OptionsDialog(
        options: options,
        dropdownTitle: dropdownTitle,
        currentValue: currentValue,
        nameGetter: nameGetter,
        future: future,
        canSearch: canSearch,
      ),
    ),
  );
}

class OptionsDialog<T> extends StatefulWidget {
  final T? currentValue;
  final List<T> options;
  final String dropdownTitle;
  final bool canSearch;
  final String Function(T option) nameGetter;
  final Future<List<T>> Function()? future;

  const OptionsDialog({
    super.key,
    required this.options,
    required this.dropdownTitle,
    required this.currentValue,
    this.canSearch = false,
    required this.nameGetter,
    this.future,
  });

  @override
  State<OptionsDialog<T>> createState() => _OptionsDialogState<T>();
}

class _OptionsDialogState<T> extends State<OptionsDialog<T>> {
  final controller = TextEditingController();
  List<T> options = [];
  final scrollController = ScrollController();
  T? current;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.options.isNotEmpty) {
      options = List.from(widget.options);
      current = widget.currentValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: kHorPadding.left,
        vertical: 30,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight: context.maxHeight - context.viewPadding.vertical - 30),
        child: buildOnData(),
      ),
    );
  }

  Widget buildOnData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TemboText(
          widget.dropdownTitle,
          style: context.textTheme.titleLarge,
        ),
        const SizedBox(height: 20),
        Flexible(
          child: Scrollbar(
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return buildOption(options[index]);
              },
              separatorBuilder: (_, __) => const SizedBox(height: 5),
              itemCount: options.length,
            ),
          ),
        )
      ],
    );
  }

  Widget buildOption(T option) {
    final isSelected = option == current;

    return Builder(
      builder: (context) {
        return TemboOptionButton(
          onTap: (option) async {
            pop() => Navigator.pop(context, option);
            current = option;
            setState(() {});
            await Future.delayed(const Duration(milliseconds: 500));
            pop();
          },
          option: option,
          name: widget.nameGetter,
          selected: isSelected,
        );
      },
    );
  }
}
