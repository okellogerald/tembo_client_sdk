import 'package:smile_identity_plugin/models/smile_data.dart';
import 'package:tembo_client_sdk/src/views/source.dart';

import '../../tembo_client_sdk.dart';

/// Prompts the users to make sure they have required documents to proceed further
class DocumentsPreparationPage extends StatefulWidget {
  static const routeName = "docs_preparation_page";
  const DocumentsPreparationPage({super.key});

  @override
  State<DocumentsPreparationPage> createState() =>
      _DocumentsPreparationPageState();
}

class _DocumentsPreparationPageState extends State<DocumentsPreparationPage> {
  @override
  Widget build(BuildContext context) {
    return TemboScaffold(
      extendBody: true,
      body: ListView(
        padding: kPagePadding,
        children: [
          const PageTitle(title: TemboTexts.dataPrepTitle),
          const SizedBox(height: 15),
          const TemboText(
            TemboTexts.dataPrepDesc,
          ),
          const SizedBox(height: 30),
          TemboText(
            TemboTexts.dataPrepRequirementsTitle,
            style: context.textTheme.labelLarge,
          ),
          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white),
              ),
              child: const TemboText("1"),
            ),
            title: const TemboText(TemboTexts.dataPrepRequirement1),
          ),
          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white),
              ),
              child: const TemboText("2"),
            ),
            title: const TemboText(TemboTexts.dataPrepRequirement2),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBarButton(
        callback: capture,
        text: TemboTexts.dataPrepNextPageCTA,
      ),
    );
  }

  TextStyle get style {
    return const TextStyle(fontWeight: FontWeight.w300, fontSize: 14);
  }

  TextStyle get boldStyle {
    return const TextStyle(fontWeight: FontWeight.w600, fontSize: 14);
  }

  void capture() async {
    final data = prepareForSmileIdentityVerification(dataManager.value);
    await smilePlugin.capture(data);
  }
}

SmileData prepareForSmileIdentityVerification(TemboUserData userData) {
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
    if (environment == Environment.test) {
      return SmileData(
        jobType: 1,
        userId: userData.userId,
        country: Country.kenya().abbrev,
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
      captureType: CaptureType.selfieAndIdCapture,
      environment: Environment.prod,
    );
  }
}
