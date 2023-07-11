
import 'package:flutter/material.dart';
import 'package:tembo_client/src/constants/colors.dart';

import 'exports.dart';

class TemboSnackbar extends SnackBar {
  final String message;
  final bool isError;
  final int? durationInSeconds;
  TemboSnackbar(this.message, this.isError, {Key? key, this.durationInSeconds})
      : super(
            key: key,
            content: TemboText(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isError ? TemboColors.onError : TemboColors.primary,
                fontSize: 14,
              ),
            ));

  @override
  Color? get backgroundColor =>
      isError ? TemboColors.error : TemboColors.onBackground;

  @override
  SnackBarBehavior? get behavior => SnackBarBehavior.floating;

  @override
  ShapeBorder? get shape =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(5));

  @override
  double? get elevation => 0;

  @override
  Duration get duration => Duration(seconds: durationInSeconds ?? 5);
}
