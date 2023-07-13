enum Gender {
  male("Male", label: "gender-male", jsonKey: "M"),
  female("Female", label: "gender-female", jsonKey: "F"),
  ;

  final String label, name;
  final String jsonKey;
  const Gender(this.name, {required this.label, required this.jsonKey});

  static Gender fromJson(String type) {
    const values = Gender.values;
    return values.where((e) => e.jsonKey == type).single;
  }
}
