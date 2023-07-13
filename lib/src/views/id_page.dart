import 'package:flutter/material.dart';
import 'package:smile_identity_plugin/models/smile_data.dart';
import 'package:tembo_client/src/components/bottom_nav_bar_button.dart';
import 'package:tembo_client/src/components/options_picker.dart';
import 'package:tembo_client/src/models/doc_type.dart';

import '../components/exports.dart';
import '../constants/styles.dart';
import '../styles/source.dart';
import 'basic_info_page.dart';

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
      appBar: AppBar(
        title: const TemboText("Identity Document Data"),
      ),
      body: ListView(
        padding: kHorPadding.copyWith(top: 20),
        children: [
          TemboPicker(
            options: VerDocumentType.values,
            onChange: onTypeSelected,
            name: (t) => t.jsonKey,
            value: type,
            dropdownTitle: "Choose Document Type:",
            hint: "Doc Type",
            style: const TemboButtonStyle.outline(),
          ),
          const SizedBox(height: 15),
          TemboTextField(
            controller: numberController,
            decoration: const TemboTextFieldDecoration(
              hint: "Document Number",
              borderColor: Colors.grey,
            ),
          ),
          const SizedBox(height: 15),
          TemboDatePicker(
            hint: "Issue Date",
            onSelected: onIssueDateSelected,
            value: issueDate,
          ),
          const SizedBox(height: 15),
          TemboDatePicker(
            hint: "Expiry Date",
            onSelected: onExpiryDateSelected,
            value: expirryDate,
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
