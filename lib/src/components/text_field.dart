import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tembo_client/src/extensions/source.dart';
import 'package:tembo_client/tembo_client.dart';

import 'text.dart';

class TemboTextField extends StatefulWidget {
  final TextEditingController? controller;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final TextCapitalization? textCapitalization;
  final TextInputType? textInputType;
  final FocusNode? focusNode;
  final bool? enabled;
  final List<TextInputFormatter>? formatters;
  final TextAlign? textAlign;
  final String? hint;

  final bool canBeUnobscured;

  const TemboTextField({
    this.controller,
    this.obscureText,
    this.validator,
    this.focusNode,
    this.enabled,
    this.textCapitalization,
    this.onChanged,
    this.textInputType,
    this.formatters,
    this.hint,
    Key? key,
    this.textAlign,
  })  : canBeUnobscured = false,
        super(key: key);

  @override
  State<TemboTextField> createState() => _TemboTextFieldState();
}

class _TemboTextFieldState extends State<TemboTextField> {
  final controllerHasTextNotifier = ValueNotifier(false);

  final errorNotifier = ValueNotifier<String?>(null);

  @override
  void initState() {
    super.initState();
    final controller = widget.controller;

    if (controller != null) {
      controllerHasTextNotifier.value = controller.text.isNotEmpty;
      controller.addListener(() {
        controllerHasTextNotifier.value = controller.text.isNotEmpty;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final decoration = theme.textFieldDecoration.copyWith(hint: widget.hint);
    final bool canExpand = decoration.size != null;

    final textfield = TextFormField(
      style: decoration.valueStyle,
      controller: widget.controller,
      focusNode: widget.focusNode,
      decoration: decoration.getInputDecoration.copyWith(
        errorStyle: context.textTheme.bodySmall.withSize(0),
      ),
      inputFormatters: widget.formatters,
      validator: validate,
      textAlign: widget.textAlign ?? TextAlign.start,
      onTap: () => errorNotifier.value = null,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      textInputAction: TextInputAction.done,
      keyboardType: widget.textInputType,
      onChanged: widget.onChanged,
      enabled: widget.enabled ?? true,
      expands: canExpand,
      maxLines: canExpand ? null : 1,
      minLines: canExpand ? null : null,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: decoration.size?.width,
          height: decoration.size?.height,
          child: textfield,
        ),
        buildError(),
      ],
    );
  }

  String? validate(String? value) {
    if (widget.validator == null) return null;
    final error = widget.validator!(value);
    if (error != null) errorNotifier.value = error;
    return error;
  }

  Widget buildError() {
    return ValueListenableBuilder(
      valueListenable: errorNotifier,
      builder: (_, error, __) {
        if (error == null) return Container();
        return Padding(
          padding: const EdgeInsets.only(top: 5),
          child: TemboText(
            error,
            style: context.textTheme.bodyMedium.withColor(
              context.colorScheme.error,
            ),
          ),
        );
      },
    );
  }
}
