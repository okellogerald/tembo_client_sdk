import 'package:flutter/material.dart';
import 'package:tembo_client_sdk/src/constants/colors.dart';

import 'source.dart';

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
                color: isError
                    ? LightTemboColors.onError
                    : LightTemboColors.primary,
                fontSize: 14,
              ),
            ));

  @override
  Color? get backgroundColor =>
      isError ? LightTemboColors.error : LightTemboColors.onBackground;

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
