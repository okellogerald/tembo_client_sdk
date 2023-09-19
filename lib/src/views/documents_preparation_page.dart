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
    return ThemeDataWrapper(builder: (context, theme) {
      return Scaffold(
        backgroundColor: theme.colorScheme.scaffoldBackground,
        appBar: AppBar(),
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: ThemeDataWrapper(
          builder: (context, theme) {
            return Container(
              padding: kHorPadding,
              constraints: const BoxConstraints.expand(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TemboText(
                    TemboTexts.dataPrepDesc,
                  ),
                  const SizedBox(height: 15),
                  ListTile(
                    leading: TemboText(
                      "1.",
                      style: boldStyle,
                    ),
                    title: TemboText(
                      TemboTexts.dataPrepRequirement1,
                      style: boldStyle,
                    ),
                  ),
                  ListTile(
                    leading: TemboText(
                      "2.",
                      style: boldStyle,
                    ),
                    title: TemboText(
                      TemboTexts.dataPrepRequirement1,
                      style: boldStyle,
                    ),
                    subtitle: TemboText(
                      TemboTexts.dataPrepSupportedDocs,
                      style: style,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 55),
                    child: Wrap(
                      runSpacing: 10,
                      spacing: 10,
                      alignment: WrapAlignment.start,
                      runAlignment: WrapAlignment.start,
                      children: List.generate(
                        VerDocumentType.values.length,
                        (index) {
                          final label = VerDocumentType.values[index].label;
                          return TemboText(
                            "· ${label.tr()}",
                            style: style.copyWith(fontWeight: FontWeight.w400),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: BottomNavBarButton(
          callback: capture,
          text: TemboTexts.dataPrepNextPageCTA,
        ),
      );
    });
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
