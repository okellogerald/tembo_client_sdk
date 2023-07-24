import 'package:smile_identity_plugin/models/smile_data.dart';

import '../../tembo_client_sdk.dart';
import 'source.dart';

class DataVerifyPage extends StatefulWidget {
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
    final userData = dataManager.value;
    final data = SmileData(
      firstName: userData.firstName!,
      lastName: userData.lastName!,
      country: userData.country!.code,
      idNumber: userData.document!.idNumber,
      idType: userData.document!.type.smileIdentityLabel,
      userId: userData.userId,
      captureType: CaptureType.selfie,
      jobType: 1,
      additionalValues: userData.otherValues,
      
    );

    await smilePlugin.capture(data);
  }
}
