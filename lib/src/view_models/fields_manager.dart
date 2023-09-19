import 'package:flutter/material.dart';

import '../../tembo_client_sdk.dart';

class UnModifiableFieldsManager extends ValueNotifier<Fields> {
  UnModifiableFieldsManager(super.fields);

  void updateList(Fields fields) {
    value = fields;
    notifyListeners();
  }

  bool canEditField(Field field) {
    return value.contains(field);
  }
}
