import 'package:smile_identity_plugin/models/smile_data.dart';

import 'package:tembo_client_sdk/src/models/country.dart';
import 'package:tembo_client_sdk/src/models/doc.dart';

import 'gender.dart';

class Data {
  /// User's country.
  ///
  /// It should be the country from which the [document] has been issued.
  final Country? country;

  /// User's first name
  final String? firstName;

  /// User's last name
  final String? lastName;

  /// User's date of birth
  final DateTime? dob;

  /// User's gender
  final Gender? gender;

  /// User's identity document. The [document] should be issued from [country]
  final VerDocument? document;

  /// User's unique id.
  ///
  /// This will help identify whether this user has already been verified at any later date.
  final String userId;

  /// Make sure to use Environment.prod before you push to production.
  final Environment? environment;

  Data({
    this.country,
    this.firstName,
    this.lastName,
    this.dob,
    this.gender,
    this.document,
    required this.userId,
    this.environment,
  });

  Data copyWith({
    Country? country,
    String? firstName,
    String? lastName,
    DateTime? dob,
    Gender? gender,
    VerDocument? document,
    String? userId,
    Environment? environment,
  }) {
    return Data(
      country: country ?? this.country,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      document: document ?? this.document,
      userId: userId ?? this.userId,
      environment: environment ?? this.environment,
    );
  }

  @override
  String toString() {
    return 'Data(country: $country, firstName: $firstName, lastName: $lastName, dob: $dob, gender: $gender, document: $document, userId: $userId, environment: $environment)';
  }

  @override
  bool operator ==(covariant Data other) {
    if (identical(this, other)) return true;

    return other.country == country &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.dob == dob &&
        other.gender == gender &&
        other.document == document &&
        other.userId == userId &&
        other.environment == environment;
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
        environment.hashCode;
  }
}
