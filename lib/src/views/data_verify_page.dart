import 'package:tembo_client_sdk/src/views/documents_preparation_page.dart';

import '../../tembo_client_sdk.dart';
import 'source.dart';

/// Users are presented all data the SDK has collected
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

    return TemboScaffold(
      body: ListView(
        padding: kPagePadding.copyWith(bottom: 30),
        children: [
          const PageTitle(title: TemboTexts.dataVerifyPageTitle),
          const SizedBox(height: 20),
          OverflowBar(
            overflowSpacing: 15,
            children: [
              TemboLabelledFormField(
                label: TemboTexts.userFirstName,
                value: data.firstName!,
              ),
              TemboLabelledFormField(
                label: TemboTexts.userLastName,
                value: data.lastName!,
              ),
              TemboLabelledFormField(
                label: TemboTexts.userGender,
                value: data.gender!.name,
              ),
              TemboLabelledFormField(
                label: TemboTexts.userDOB,
                value: data.dob!.format(),
              ),
              TemboLabelledFormField(
                label: TemboTexts.userCountry,
                value: data.country!.name,
              ),
              TemboLabelledFormField(
                label: TemboTexts.docType,
                value: data.document!.type.jsonKey,
              ),
              TemboLabelledFormField(
                label: TemboTexts.docNumber,
                value: data.document!.idNumber,
              ),
              TemboLabelledFormField(
                label: TemboTexts.docIssueDate,
                value: data.document!.issueDate.format(),
              ),
              TemboLabelledFormField(
                label: TemboTexts.docExpiryDate,
                value: data.document!.expiryDate.format(),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBarButton(
        callback: () => push(
          context,
          routeName: DocumentsPreparationPage.routeName,
          page: const DocumentsPreparationPage(),
        ),
      ),
    );
  }
}
