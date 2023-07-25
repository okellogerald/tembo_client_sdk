import 'package:tembo_client_sdk/tembo_client_sdk.dart';

enum Gender {
  male("Male", label: TemboTexts.gendersMale, jsonKey: "M"),
  female("Female", label: TemboTexts.gendersFemale, jsonKey: "F"),
  ;

  final String label, name;
  final String jsonKey;
  const Gender(this.name, {required this.label, required this.jsonKey});

  static Gender fromJson(String type) {
    const values = Gender.values;
    return values.where((e) => e.jsonKey == type).single;
  }
}
