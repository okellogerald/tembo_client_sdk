import 'package:tembo_client/src/utils/source.dart';

import 'doc_type.dart';

class VerDocument {
  final VerDocumentType type;
  final String idNumber;
  final DateTime issueDate, expiryDate;

  const VerDocument({
    required this.expiryDate,
    required this.idNumber,
    required this.type,
    required this.issueDate,
  });

  factory VerDocument.fromMap(var map) {
    return VerDocument(
      expiryDate: (map["expiryDate"] as String).parse(),
      issueDate: (map["issueDate"] as String).parse(),
      idNumber: map['number'],
      type: VerDocumentType.fromJson(map['type']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "issueDate": issueDate.toUtc().format(),
      "expiryDate": expiryDate.toUtc().format(),
      "number": idNumber,
      "type": type.jsonKey,
    };
  }

  VerDocument copyWith({
    VerDocumentType? type,
    String? idNumber,
    DateTime? issueDate,
    DateTime? expiryDate,
  }) {
    return VerDocument(
      type: type ?? this.type,
      idNumber: idNumber ?? this.idNumber,
      expiryDate: expiryDate ?? this.expiryDate,
      issueDate: issueDate ?? this.issueDate,
    );
  }

  @override
  bool operator ==(covariant VerDocument other) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.idNumber == idNumber &&
        other.issueDate == issueDate &&
        other.expiryDate == expiryDate;
  }

  @override
  int get hashCode =>
      type.hashCode ^
      idNumber.hashCode ^
      expiryDate.hashCode ^
      issueDate.hashCode;

  @override
  String toString() =>
      'VerDocument(type: $type, idNumber: $idNumber, expiryDate: $expiryDate, issueDate: $issueDate)';
}
