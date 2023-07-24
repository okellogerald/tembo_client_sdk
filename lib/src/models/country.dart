class Country {
  final String name;
  final String abbrev;

  const Country({
    required this.name,
    required this.abbrev,
  });

  factory Country.fromMap(Map<String, String> map) {
    return Country(
      name: map['name']!,
      abbrev: map['abbrev']!,
    );
  }

  factory Country.tz() {
    final map = {
      "name": "Tanzania",
      "abbrev": "TZ"
    };
    return Country.fromMap(map);
  }

  factory Country.kenya() {
    final map = {
      "name": "Kenya",
      "abbrev": "KE"
    };
    return Country.fromMap(map);
  }

  factory Country.ghana() {
    final map = {
      "name": "Ghana",
      "abbrev": "GH"
    };
    return Country.fromMap(map);
  }

  factory Country.nigeria() {
    final map = {
      "name": "Nigeria",
      "abbrev": "NG"
    };
    return Country.fromMap(map);
  }

  factory Country.uganda() {
    final map = {
      "name": "Uganda",
      "abbrev": "UG"
    };
    return Country.fromMap(map);
  }

  @override
  bool operator ==(covariant Country other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.abbrev == abbrev;
  }

  @override
  int get hashCode => name.hashCode ^ abbrev.hashCode;
}

final supportedCountries = [
  Country.tz(),
  Country.kenya(),
  Country.uganda(),
  Country.nigeria(),
  Country.ghana(),
];
