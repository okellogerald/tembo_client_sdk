import 'package:flutter/material.dart';
import 'package:tembo_client_sdk/src/view_models/fields_manager.dart';
import 'package:tembo_client_sdk/tembo_client_sdk.dart';

/// Exposes the most recent [TemboThemeData] instance
class FieldWrapper extends StatelessWidget {
  final Field field;
  final Widget Function(BuildContext context, bool canUpdate) builder;

  const FieldWrapper({
    super.key,
    required this.field,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: fieldsManager,
      builder: (context, fields, child) {
        return builder(context, !fields.contains(field));
      },
    );
  }
}

