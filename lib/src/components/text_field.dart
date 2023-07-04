import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tembo_client/src/extensions/source.dart';

import '../styles/source.dart';
import 'text.dart';

class TemboTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TemboTextFieldDecoration? decoration;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final TextCapitalization? textCapitalization;
  final TextInputType? textInputType;
  final FocusNode? focusNode;
  final bool? enabled;
  final List<TextInputFormatter>? formatters;
  final TextStyle? style;
  final TextAlign? textAlign;

  final bool _obscured;
  final bool canBeUnobscured;

  const TemboTextField.obscured({
    this.controller,
    this.decoration,
    this.obscureText,
    this.validator,
    this.focusNode,
    this.enabled,
    this.textCapitalization,
    this.onChanged,
    this.textInputType,
    this.formatters,
    this.canBeUnobscured = true,
    this.style,
    Key? key,
    this.textAlign,
  })  : _obscured = true,
        super(key: key);

  const TemboTextField({
    this.controller,
    this.decoration,
    this.obscureText,
    this.validator,
    this.focusNode,
    this.enabled,
    this.textCapitalization,
    this.onChanged,
    this.textInputType,
    this.formatters,
    this.style,
    Key? key,
    this.textAlign,
  })  : _obscured = false,
        canBeUnobscured = false,
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

    if (controller != null && widget._obscured) {
      controllerHasTextNotifier.value = controller.text.isNotEmpty;
      controller.addListener(() {
        controllerHasTextNotifier.value = controller.text.isNotEmpty;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool canExpand = widget.decoration?.size != null;

    final textfield = TextFormField(
      style: widget.style ?? context.textTheme.bodyMedium,
      controller: widget.controller,
      focusNode: widget.focusNode,
      decoration: widget.decoration?.getInputDecoration.copyWith(
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
          width: widget.decoration?.size?.width,
          height: widget.decoration?.size?.height,
          child: widget._obscured ? buildPasswordField() : textfield,
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

  Widget buildPasswordField() {
    bool obscureText = true;

    return StatefulBuilder(builder: (context, setState) {
      return TextFormField(
        controller: widget.controller,
        inputFormatters: widget.formatters,
        focusNode: widget.focusNode,
        style: context.textTheme.bodyMedium,

//        style: const TextStyle(fontWeight: FontWeight.w500),
        decoration: widget.decoration?.getInputDecoration.copyWith(
          suffixIcon: ValueListenableBuilder<bool>(
            valueListenable: controllerHasTextNotifier,
            builder: (context, hasText, snapshot) {
              emptyContainer() {
                return const SizedBox(
                  height: .0001,
                  width: .00001,
                );
              }

              if (!widget.canBeUnobscured) return emptyContainer();
              return hasText
                  ? InkWell(
                      onTap: () {
                        obscureText = !obscureText;
                        setState(() {});
                      },
                      child: Icon(
                        !obscureText ? Icons.visibility_off : Icons.visibility,
                        size: 24,
                      ),
                    )
                  : emptyContainer();
            },
          ),
        ),
        obscureText: obscureText,
        validator: widget.validator,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        keyboardType: widget.textInputType,
        onChanged: widget.onChanged,
      );
    });
  }
}
