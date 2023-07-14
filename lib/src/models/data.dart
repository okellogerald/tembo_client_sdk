import 'package:flutter/foundation.dart';

import 'package:tembo_client/src/models/country.dart';
import 'package:tembo_client/src/models/doc.dart';

import 'gender.dart';

class Data {
  final Country? country;
  final String? firstName;
  final String? lastName;
  final DateTime? dob;
  final Gender? gender;
  final VerDocument? document;
  final String userId;
  final Map<String, dynamic>? otherValues;

  Data({
    this.country,
    this.firstName,
    this.lastName,
    this.dob,
    this.gender,
    this.document,
    required this.userId,
    this.otherValues,
  });

  Data copyWith({
    Country? country,
    String? firstName,
    String? lastName,
    DateTime? dob,
    Gender? gender,
    VerDocument? document,
  }) {
    return Data(
      country: country ?? this.country,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      document: document ?? this.document,
      userId: userId,
      otherValues: otherValues,
    );
  }

  @override
  String toString() {
    return 'Data(country: $country, firstName: $firstName, lastName: $lastName, dob: $dob, gender: $gender, document: $document, userId: $userId, otherValues: $otherValues)';
  }

  @override
  bool operator ==(covariant Data other) {
    if (identical(this, other)) return true;
  
    return 
      other.country == country &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.dob == dob &&
      other.gender == gender &&
      other.document == document &&
      other.userId == userId &&
      mapEquals(other.otherValues, otherValues);
  }

  @override
  int get hashCode {
    return country.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      dob.hashCode ^
      gender.hashCode ^
      document.hashCode ^
      userId.hashCode ^
      otherValues.hashCode;
  }
}
