import 'package:flutter/material.dart';
import 'package:smile_identity_plugin/smile_identity_plugin.dart';
import 'package:tembo_client/src/components/page_title.dart';
import 'package:tembo_client/src/utils/navigation_utils.dart';
import 'package:tembo_client/src/views/gender_pick_page.dart';
import 'package:tembo_client/src/views/submit_page.dart';

import '../components/bottom_nav_bar_button.dart';
import '../components/exports.dart';
import '../constants/constants.dart';

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
      final captureError = state.captureState.error;
      if (captureError != null) {
        if (context.mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(captureError)));
        }
      }

      if (state.captureState.didCaptureSuccessfully &&
          state.submitState.isNone) {
        push(context, page: const SubmitPage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: kPagePadding,
        children: [
          const PageTitle(title: "Basic Info"),
          const SizedBox(height: 15),
          TemboTextField(
            controller: firstNameController,
            textCapitalization: TextCapitalization.words,
            hint: "First Name",
          ),
          const SizedBox(height: 15),
          TemboTextField(
            controller: lastNameController,
            textCapitalization: TextCapitalization.words,
            hint: "Last Name",
          ),
          const SizedBox(height: 15),
          TemboDatePicker(
            value: date,
            onSelected: onDateSelected,
            hint: "Date of Birth",
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBarButton(
        callback: getPlatfromVersion,
      ),
    );
  }

  void getPlatfromVersion() async {
    push(context, page: const GenderPickPage());
  }

  void onDateSelected(DateTime value) {
    date = value;
    setState(() {});
  }
}
