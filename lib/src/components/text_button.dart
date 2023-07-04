import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tembo_client/src/extensions/source.dart';

import '../styles/source.dart';

class TemboTextButton extends StatefulWidget {
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final Widget child;
  final TemboButtonStyle? style;

  const TemboTextButton({
    super.key,
    required this.onPressed,
    this.onLongPress,
    this.style,
    required this.child,
  });

  @override
  State<TemboTextButton> createState() => _TemboTextButtonState();
}

class _TemboTextButtonState extends State<TemboTextButton> {
  TemboButtonStyle get _style =>
      widget.style ?? const TemboButtonStyle.transparent();

  @override
  Widget build(BuildContext context) {
    final height = widget.style?.height;
    final width = widget.style?.width;

    if ((height != null && height <= 35) || (width != null && width <= 35)) {
      return GestureDetector(
        onTap: _onPressed,
        onLongPress: _onLongPress,
        child: Container(
          padding: widget.style?.padding,
          width: widget.style?.width?.toDouble(),
          height: widget.style?.height?.toDouble(),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: widget.style?.backgroundColor,
            borderRadius: BorderRadius.circular(
              widget.style?.borderRadius?.toDouble() ?? 0.0,
            ),
            border: Border.all(
              color: widget.style?.borderColor ?? Colors.transparent,
              width: widget.style?.borderWidth?.toDouble() ?? 1,
            ),
          ),
          child: getChild(context),
        ),
      );
    }

    return TextButton(
      onPressed: _onPressed,
      onLongPress: _onLongPress,
      style: _style.buttonStyle,
      child: getChild(context),
    );
  }

  void _onPressed() {
    widget.onPressed();
  }

  void _onLongPress() {
    if (widget.onLongPress != null) widget.onLongPress!();
  }

  Widget getChild(BuildContext context) {
    return DefaultTextStyle(
        style: _style.getTextStyle ??
            context.textTheme.bodyMedium.withFW300
                .copyWith(color: _style.foregroundColor),
        child: IconTheme(
          data: IconThemeData(color: _style.foregroundColor),
          child: widget.child,
        ));
  }
}

class TemboPlainTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final TextStyle? style;

  const TemboPlainTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: RichText(
        text: TextSpan(
          text: text,
          style:
              style ?? context.textTheme.bodySmall.withFW300.withPrimaryColor,
          recognizer: TapGestureRecognizer()..onTap = onPressed,
        ),
      ),
    );
  }
}