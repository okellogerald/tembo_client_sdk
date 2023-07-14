import 'package:flutter/material.dart';
import 'package:tembo_client/src/components/bottom_nav_bar_button.dart';
import 'package:tembo_client/src/components/chip_picker.dart';
import 'package:tembo_client/src/extensions/source.dart';
import 'package:tembo_client/src/models/doc.dart';
import 'package:tembo_client/src/utils/navigation_utils.dart';
import 'package:tembo_client/src/utils/source.dart';
import 'package:tembo_client/src/widgets/page_title.dart';
import 'package:tembo_client/src/models/doc_type.dart';
import 'package:tembo_client/tembo_client.dart';

import '../components/exports.dart';
import '../components/form/form.dart';
import '../constants/constants.dart';
import '../widgets/validation_error_view.dart';
import 'data_verify_page.dart';

class IDPage extends StatefulWidget {
  const IDPage({super.key});

  @override
  State<IDPage> createState() => _IDPageState();
}

class _IDPageState extends State<IDPage> {
  final numberController = TextEditingController();
  DateTime? issueDate, expiryDate;
  VerDocumentType? type;

  String? error;
  String? issueDateError, expiryDateError;

  final formKey = GlobalKey<TemboFormState>();

  @override
  void initState() {
    super.initState();
    numberController.text = dataManager.value.document?.idNumber ?? "";
    issueDate = dataManager.value.document?.issueDate;
    expiryDate = dataManager.value.document?.expiryDate;
    type = dataManager.value.document?.type;
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

    push(context, page: const DataVerifyPage());
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
