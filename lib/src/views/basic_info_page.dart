import 'package:flutter/material.dart';
import 'package:smile_identity_plugin/models/smile_data.dart';
import 'package:smile_identity_plugin/smile_identity_plugin.dart';
import 'package:tembo_client/src/styles/source.dart';
import 'package:tembo_client/src/utils/navigation_utils.dart';
import 'package:tembo_client/src/views/submit_page.dart';

import '../components/exports.dart';
import '../constants/styles.dart';

final smilePlugin = SmileIdentityPlugin();

class BasicInfoPage extends StatefulWidget {
  const BasicInfoPage({super.key});

  @override
  State<BasicInfoPage> createState() => _BasicInfoPageState();
}

class _BasicInfoPageState extends State<BasicInfoPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  DateTime? date;

  @override
  void initState() {
    super.initState();

    smilePlugin.onStateChanged.listen((state) {
      if (state.hasError) {
        if (context.mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error!)));
        }
      }
      if (state.captured) {
        push(context, page: const SubmitPage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TemboText("Basic Info Page"),
      ),
      body: ListView(
        padding: kHorPadding.copyWith(top: 20),
        children: [
          TemboTextField(
            controller: firstNameController,
            decoration: const TemboTextFieldDecoration(
              hint: "First Name",
              borderColor: Colors.grey,
            ),
          ),
          const SizedBox(height: 15),
          TemboTextField(
            controller: lastNameController,
            decoration: const TemboTextFieldDecoration(
              hint: "Last Name",
              borderColor: Colors.grey,
            ),
          ),
          const SizedBox(height: 15),
          TemboDatePicker(
            hint: "Date of birth",
            onSelected: onDateSelected,
          ),
          const SizedBox(height: 15),
          TemboTextButton(
            onPressed: getPlatfromVersion,
            style: const TemboButtonStyle.filled(),
            child: const TemboText("Continue"),
          )
        ],
      ),
    );
  }

  void getPlatfromVersion() async {
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

  void onDateSelected(DateTime value) {
    date = value;
    setState(() {});
  }
}
