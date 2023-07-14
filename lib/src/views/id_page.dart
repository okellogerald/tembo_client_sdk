import 'package:flutter/material.dart';
import 'package:smile_identity_plugin/models/smile_data.dart';
import 'package:tembo_client/src/components/bottom_nav_bar_button.dart';
import 'package:tembo_client/src/components/chip_picker.dart';
import 'package:tembo_client/src/components/page_title.dart';
import 'package:tembo_client/src/extensions/context_extension.dart';
import 'package:tembo_client/src/models/doc_type.dart';
import 'package:tembo_client/tembo_client.dart';

import '../components/exports.dart';
import '../constants/constants.dart';

class IDPage extends StatefulWidget {
  const IDPage({super.key});

  @override
  State<IDPage> createState() => _IDPageState();
}

class _IDPageState extends State<IDPage> {
  final numberController = TextEditingController();
  DateTime? issueDate, expirryDate;
  VerDocumentType? type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
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
          /*  TemboPicker(
            options: VerDocumentType.values,
            onChange: onTypeSelected,
            name: (t) => t.jsonKey,
            value: type,
            dropdownTitle: "Choose Document Type:",
            hint: "Doc Type",
            style: const TemboButtonStyle.outline(),
          ),*/
          const SizedBox(height: 25),
          TemboTextField(
            controller: numberController,
            hint: "Document Number",
          ),
          const SizedBox(height: 15),
          TemboDatePicker(
            onSelected: onIssueDateSelected,
            value: issueDate,
            hint: "Issue Date",
          ),
          const SizedBox(height: 15),
          TemboDatePicker(
            onSelected: onExpiryDateSelected,
            value: expirryDate,
            hint: "Expiry Date",
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBarButton(
        callback: next,
      ),
    );
  }

  void onIssueDateSelected(DateTime date) {
    issueDate = date;
  }

  void onExpiryDateSelected(DateTime date) {
    expirryDate = date;
  }

  void onTypeSelected(VerDocumentType value) {
    type = value;
    setState(() {});
  }

  void next() async {
    final data = SmileData(
      firstName: "John",
      lastName: "Doe",
      country: "KE",
      idNumber: "10000",
      idType: "NATIONAL_ID",
      userId: "user-id",
      captureType: CaptureType.selfie,
      jobType: 1,
    );
    await smilePlugin.capture(data);
  }
}
