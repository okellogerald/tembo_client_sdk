import 'package:flutter/material.dart';
import 'package:tembo_client_sdk/src/models/country.dart';
import 'package:tembo_client_sdk/src/models/user_data.dart';
import 'package:tembo_client_sdk/src/models/doc.dart';
import 'package:tembo_client_sdk/src/models/gender.dart';

class DataManager extends ValueNotifier<UserData> {
  DataManager(super.data);

  void updateFirstName(String firstName) {
    value = value.copyWith(firstName: firstName);
    notifyListeners();
  }

  void updateLastName(String name) {
    value = value.copyWith(lastName: name);
    notifyListeners();
  }

  void updateGender(Gender gender) {
    value = value.copyWith(gender: gender);
    notifyListeners();
  }

  void updateCountry(Country country) {
    value = value.copyWith(country: country);
    notifyListeners();
  }

  void updateDOB(DateTime dob) {
    value = value.copyWith(dob: dob);
    notifyListeners();
  }

  void updateDocument(VerDocument doc) {
    value = value.copyWith(document: doc);
    notifyListeners();
  }

  void updateData(UserData data) {
    value = data;
    notifyListeners();
  }
}
