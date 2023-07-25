import 'package:smile_identity_plugin/models/smile_data.dart';

import '../../tembo_client_sdk.dart';
import 'source.dart';

class DataVerifyPage extends StatefulWidget {
  static const routeName = "data_verify";
  const DataVerifyPage({super.key});

  @override
  State<DataVerifyPage> createState() => _DataVerifyPageState();
}

class _DataVerifyPageState extends State<DataVerifyPage> {
  @override
  Widget build(BuildContext context) {
    final data = dataManager.value;

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: kPagePadding.copyWith(bottom: 30),
        children: [
          const PageTitle(title: "Is this okay?"),
          const SizedBox(height: 20),
          OverflowBar(
            overflowSpacing: 15,
            children: [
              TemboLabelledFormField(
                label: "First Name",
                value: data.firstName!,
              ),
              TemboLabelledFormField(
                label: "Last Name",
                value: data.lastName!,
              ),
              TemboLabelledFormField(
                label: "Gender",
                value: data.gender!.name,
              ),
              TemboLabelledFormField(
                label: "Date of Birth",
                value: data.dob!.format(),
              ),
              TemboLabelledFormField(
                label: "Country",
                value: data.country!.name,
              ),
              TemboLabelledFormField(
                label: "Document Type",
                value: data.document!.type.jsonKey,
              ),
              TemboLabelledFormField(
                label: "Document Number",
                value: data.document!.idNumber,
              ),
              TemboLabelledFormField(
                label: "Document Issue Date",
                value: data.document!.issueDate.format(),
              ),
              TemboLabelledFormField(
                label: "Document Expiry Date",
                value: data.document!.expiryDate.format(),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBarButton(
        callback: capture,
      ),
    );
  }

  void capture() async {
    final data = prepareForSmileIdentityVerification(dataManager.value);
    await smilePlugin.capture(data);
  }
}

SmileData prepareForSmileIdentityVerification(Data userData) {
  // For Tanzania, Smile Identity does not offer full support.
  // The following configurations work for Tanzania:
  //    JobType: 1
  //    CaptureType: selfieAndIdCapture
  //    Country: Kenya
  //    ** Setting names (first and last) and document data won't work as
  //    ** Smile Identity will attempt to verify the names and document data
  //    ** against entries in the Kenyan Govt identification data
  // Smile will only verify whether the selfie taken matches the photo on the document.
  if (userData.country == Country.tz()) {
    if (userData.environment == Environment.test) {
      return SmileData(
        jobType: 1,
        userId: userData.userId,
        country: Country.kenya().abbrev,
        additionalValues: userData.otherValues,
        captureType: CaptureType.selfieAndIdCapture,
        environment: Environment.test,
        firstName: userData.firstName,
        lastName: userData.lastName,
        idType: userData.document!.type.smileIdentityLabel,
        idNumber: userData.document!.idNumber,
      );
    }
    return SmileData(
      jobType: 1,
      userId: userData.userId,
      country: Country.kenya().abbrev,
      additionalValues: userData.otherValues,
      captureType: CaptureType.selfieAndIdCapture,
      environment: Environment.prod,
    );
  } else {
    return SmileData(
      firstName: userData.firstName!,
      lastName: userData.lastName!,
      country: userData.country!.abbrev,
      idNumber: userData.document!.idNumber,
      idType: userData.document!.type.smileIdentityLabel,
      userId: userData.userId,
      jobType: 1,
      additionalValues: userData.otherValues,
      captureType: CaptureType.selfieAndIdCapture,
      environment: Environment.prod,
    );
  }
}
