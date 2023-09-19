import 'package:tembo_client_sdk/tembo_client_sdk.dart';

import 'source.dart';
import 'data_verify_page.dart';

/// Gets user document
class IDPage extends StatefulWidget {
  static const routeName = "id_pick";
  const IDPage({super.key});

  @override
  State<IDPage> createState() => _IDPageState();
}

class _IDPageState extends TemboState<IDPage> {
  final numberController = TextEditingController();
  DateTime? issueDate, expiryDate;
  VerDocumentType? type;

  String? error;
  String? issueDateError, expiryDateError;

  final formKey = GlobalKey<TemboFormState>();

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    numberController.text = dataManager.value.document?.idNumber ?? "";
    issueDate = dataManager.value.document?.issueDate;
    expiryDate = dataManager.value.document?.expiryDate;
    type = dataManager.value.document?.type;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TemboScaffold(
      body: TemboForm(
        key: formKey,
        child: ListView(
          padding: kPagePadding,
          children: [
            const PageTitle(title: TemboTexts.docDataPageTitle),
            const SizedBox(height: 15),
            const TemboText(TemboTexts.docType),
            const SizedBox(height: 10),
            FieldWrapper(
              field: Field.docType,
              builder: (_, canUpdate) => TemboPicker2(
                options: VerDocumentType.values,
                onChange: onTypeSelected,
                label: (t) => t.label,
                selected: (p0) => p0 == type,
                active: canUpdate,
              ),
            ),
            const SizedBox(height: 25),
            FieldWrapper(
              field: Field.docNumber,
              builder: (_, canUpdate) => TemboTextField(
                controller: numberController,
                hint: TemboTexts.docNumber,
                validator: validateName,
                enabled: canUpdate,
              ),
            ),
            const SizedBox(height: 15),
            FieldWrapper(
              field: Field.docIssueDate,
              builder: (_, canUpdate) => TemboDatePicker(
                onSelected: onIssueDateSelected,
                value: issueDate,
                hint: TemboTexts.docIssueDate,
                error: issueDateError,
                active: canUpdate,
              ),
            ),
            const SizedBox(height: 15),
            FieldWrapper(
              field: Field.docExpiryDate,
              builder: (_, canUpdate) => TemboDatePicker(
                onSelected: onExpiryDateSelected,
                value: expiryDate,
                hint: TemboTexts.docExpiryDate,
                error: expiryDateError,
                active: canUpdate,
              ),
            ),
            const SizedBox(height: 25),
            ValidationErrorView(error: error),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarButton(
        callback: next,
      ),
    );
  }

  void onIssueDateSelected(DateTime date) {
    issueDate = date;
    issueDateError = null;
    setState(() {});
  }

  void onExpiryDateSelected(DateTime date) {
    expiryDate = date;
    expiryDateError = null;
    setState(() {});
  }

  void onTypeSelected(VerDocumentType value) {
    type = value;
    error = null;
    setState(() {});
  }

  void next() async {
    final valid = validate();
    if (!valid) return;

    dataManager.updateDocument(
      VerDocument(
        expiryDate: expiryDate!,
        idNumber: numberController.compactText!,
        type: type!,
        issueDate: issueDate!,
      ),
    );

    push(
      context,
      routeName: DataVerifyPage.routeName,
      page: const DataVerifyPage(),
    );
  }

  bool validate() {
    final hasNoFormErrors = formKey.currentState?.validate() ?? false;

    issueDateError = null;
    expiryDateError = null;
    error = null;

    if (issueDate == null) {
      issueDateError = TemboTexts.errorsIssueDateRequired;
    }

    if (expiryDate == null) {
      expiryDateError = TemboTexts.errorsExpiryDateRequired;
    }

    if (type == null) {
      error = TemboTexts.errorsDocTypeRequired;
    }

    setState(() {});

    return expiryDate != null &&
        issueDate != null &&
        hasNoFormErrors &&
        type != null;
  }
}
