import 'package:tembo_client_sdk/tembo_client_sdk.dart';

enum VerDocumentType {
  driverLicense(
    jsonKey: "Driver Licence",
    label: TemboTexts.docTypeDriversLicense,
    smileIdentityLabel: "DRIVERS_LICENSE",
  ),
  passport(
    jsonKey: "Passport",
    label: TemboTexts.docTypePassport,
    smileIdentityLabel: "PASSPORT",
  ),
  nida(
    jsonKey: "NIDA",
    label: TemboTexts.docTypeNationalID,
    smileIdentityLabel: "NATIONAL_ID",
  ),
  ;

  final String jsonKey, label, smileIdentityLabel;
  const VerDocumentType({
    required this.jsonKey,
    required this.label,
    required this.smileIdentityLabel,
  });

  static VerDocumentType fromJson(String type) {
    const values = VerDocumentType.values;
    return values.where((e) => e.jsonKey == type).single;
  }
}

enum VerStatus {
  none(jsonKey: "none"),
  passed(jsonKey: "passed"),
  failed(jsonKey: "failed"),
  ;

  final String jsonKey;
  const VerStatus({required this.jsonKey});

  static VerStatus fromJson(String type) {
    const values = VerStatus.values;
    return values.where((e) => e.jsonKey == type.toLowerCase()).single;
  }
}
