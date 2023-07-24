class Country {
  final String image;
  final String fullName;
  final String dialCode;
  final String shortName;

  const Country({
    required this.image,
    required this.fullName,
    required this.dialCode,
    required this.shortName,
  });

  String get name => "$fullName ($shortName)";

  String get code => dialCode.replaceAll(" ", "").replaceAll("+", "");

  factory Country.fromMap(Map<String, String> map) {
    return Country(
      image: map['emoji']!,
      fullName: map['name']!,
      dialCode: map['dial_code']!,
      shortName: map['code']!,
    );
  }

  factory Country.tz() {
    final map = {
      "name": "Tanzania",
      "dial_code": "+255",
      "emoji": "🇹🇿",
      "code": "TZ"
    };
    return Country.fromMap(map);
  }

  factory Country.kenya() {
    final map = {
      "name": "Kenya",
      "dial_code": "+255",
      "emoji": "🇹🇿",
      "code": "KE"
    };
    return Country.fromMap(map);
  }

  factory Country.ghana() {
    final map = {
      "name": "Ghana",
      "dial_code": "+255",
      "emoji": "🇹🇿",
      "code": "GH"
    };
    return Country.fromMap(map);
  }

  factory Country.nigeria() {
    final map = {
      "name": "Nigeria",
      "dial_code": "+255",
      "emoji": "🇹🇿",
      "code": "NG"
    };
    return Country.fromMap(map);
  }

  factory Country.uganda() {
    final map = {
      "name": "Uganda",
      "dial_code": "+253",
      "emoji": "🇹🇿",
      "code": "UG"
    };
    return Country.fromMap(map);
  }

  @override
  bool operator ==(covariant Country other) {
    if (identical(this, other)) return true;
  
    return 
      other.image == image &&
      other.fullName == fullName &&
      other.dialCode == dialCode &&
      other.shortName == shortName;
  }

  @override
  int get hashCode {
    return image.hashCode ^
      fullName.hashCode ^
      dialCode.hashCode ^
      shortName.hashCode;
  }
}

final supportedCountries = [
  Country.tz(),
  Country.kenya(),
  Country.uganda(),
  Country.nigeria(),
  Country.ghana(),
];
