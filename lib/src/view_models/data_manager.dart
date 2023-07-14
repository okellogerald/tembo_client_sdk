import 'package:flutter/material.dart';
import 'package:tembo_client/src/models/country.dart';
import 'package:tembo_client/src/models/data.dart';
import 'package:tembo_client/src/models/doc.dart';
import 'package:tembo_client/src/models/gender.dart';

class DataManager extends ValueNotifier<Data> {
  DataManager() : super(Data());

  void updateFirstName(String firstName) {
    value = value.copyWith(firstName: firstName);
    notifyListeners();
  }

  void updateLastName(String firstName) {
    value = value.copyWith(firstName: firstName);
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

  void updateData(Data data) {
    value = data;
    notifyListeners();
  }
}
