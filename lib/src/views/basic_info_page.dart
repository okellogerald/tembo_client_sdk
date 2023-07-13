import 'package:flutter/material.dart';
import 'package:smile_identity_plugin/smile_identity_plugin.dart';
import 'package:tembo_client/src/extensions/context_extension.dart';
import 'package:tembo_client/src/extensions/textstyle_extension.dart';
import 'package:tembo_client/src/styles/source.dart';
import 'package:tembo_client/src/utils/navigation_utils.dart';
import 'package:tembo_client/src/views/gender_pick_page.dart';
import 'package:tembo_client/src/views/submit_page.dart';

import '../components/bottom_nav_bar_button.dart';
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
      appBar: AppBar(
        title: const TemboText("Basic Info Page"),
      ),
      body: ListView(
        padding: kHorPadding.copyWith(top: 20),
        children: [
          TemboTextField(
            controller: firstNameController,
            style: context.textTheme.bodyLarge.withFW400.withSize(22),
            textCapitalization: TextCapitalization.words,
            decoration: const TemboTextFieldDecoration(
              hint: "First Name",
              borderColor: Colors.black54,
              size: Size.fromHeight(55),
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),
          ),
          const SizedBox(height: 15),
          TemboTextField(
            controller: lastNameController,
            style: context.textTheme.bodyLarge.withFW400.withSize(22),
            textCapitalization: TextCapitalization.words,
            decoration: const TemboTextFieldDecoration(
              hint: "Last Name",
              borderColor: Colors.black54,
              size: Size.fromHeight(55),
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),
          ),
          const SizedBox(height: 15),
          TemboDatePicker(
            hint: "Date of birth",
            value: date,
            onSelected: onDateSelected,
            style: const TemboButtonStyle.outline(
              height: 55,
              borderColor: Colors.black54,
            ),
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
