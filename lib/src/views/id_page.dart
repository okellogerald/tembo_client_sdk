import 'package:tembo_client_sdk/tembo_client_sdk.dart';

import 'source.dart';
import 'data_verify_page.dart';

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
    return Scaffold(
      appBar: AppBar(),
      body: TemboForm(
        key: formKey,
        child: ListView(
          padding: kPagePadding,
          children: [
            const PageTitle(title: "Identity Document Data"),
            const SizedBox(height: 15),
            TemboText(
              "Document Type",
              style: context.textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),
            TemboPicker2(
              options: VerDocumentType.values,
              onChange: onTypeSelected,
              label: (t) => t.jsonKey,
              selected: (p0) => p0 == type,
            ),
            const SizedBox(height: 25),
            TemboTextField(
              controller: numberController,
              hint: "Document Number",
              validator: validateName,
            ),
            const SizedBox(height: 15),
            TemboDatePicker(
              onSelected: onIssueDateSelected,
              value: issueDate,
              hint: "Issue Date",
              error: issueDateError,
            ),
            const SizedBox(height: 15),
            TemboDatePicker(
              onSelected: onExpiryDateSelected,
              value: expiryDate,
              hint: "Expiry Date",
              error: expiryDateError,
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
      issueDateError = "Issue date is required";
    }

    if (expiryDate == null) {
      expiryDateError = "Expiry date is required";
    }

    if (type == null) {
      error = "Document type is required";
    }

    setState(() {});

    return expiryDate != null &&
        issueDate != null &&
        hasNoFormErrors &&
        type != null;
  }
}
