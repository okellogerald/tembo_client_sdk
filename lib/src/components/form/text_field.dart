import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tembo_client_sdk/src/extensions/source.dart';
import 'package:tembo_client_sdk/tembo_client_sdk.dart';

import '../../widgets/theme_data_wrapper.dart';
import 'text_form_field.dart';
import '../text.dart';

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
    return ThemeDataWrapper(builder: (context, theme) {
      return ValueListenableBuilder(
          valueListenable: localeManager,
          builder: (context, _, __) {
            final decoration = theme.textFieldDecoration
                .copyFontFamily(theme.fontFamily)
                .copyWith(hint: widget.hint?.tr());
            final bool canExpand = decoration.size != null;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: decoration.size?.width,
                  height: decoration.size?.height,
                  child: ValueListenableBuilder<String?>(
                      valueListenable: errorNotifier,
                      builder: (context, error, snapshot) {
                        final hasError = error != null;

                        return TemboTextFormField(
                          style: decoration.valueStyle,
                          controller: widget.controller,
                          focusNode: widget.focusNode,
                          decoration: hasError
                              ? decoration
                                  .copyWith(borderColor: LightTemboColors.error)
                                  .getInputDecoration
                              : decoration.getInputDecoration.copyWith(
                                  errorStyle:
                                      context.textTheme.bodySmall.withSize(0),
                                ),
                          inputFormatters: widget.formatters,
                          validator: validate,
                          textAlign: widget.textAlign ?? TextAlign.start,
                          onTap: () => errorNotifier.value = null,
                          textCapitalization: widget.textCapitalization ??
                              TextCapitalization.none,
                          textInputAction: TextInputAction.done,
                          keyboardType: widget.textInputType,
                          onChanged: widget.onChanged,
                          enabled: widget.enabled ?? true,
                          expands: canExpand,
                          maxLines: canExpand ? null : 1,
                          minLines: canExpand ? null : null,
                        );
                      }),
                ),
                buildError(),
              ],
            );
          });
    });
  }

  String? validate(String? value) {
    if (widget.validator == null) return null;
    final error = widget.validator!(value);
    if (error != null) errorNotifier.value = error;
    return null;
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
              LightTemboColors.error,
            ),
          ),
        );
      },
    );
  }
}
