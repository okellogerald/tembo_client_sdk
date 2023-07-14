import 'package:flutter/material.dart';
import 'package:smile_identity_plugin/smile_identity_plugin.dart';
import 'package:tembo_client/src/widgets/page_title.dart';
import 'package:tembo_client/src/extensions/source.dart';
import 'package:tembo_client/src/utils/navigation_utils.dart';
import 'package:tembo_client/src/utils/source.dart';
import 'package:tembo_client/src/views/gender_pick_page.dart';
import 'package:tembo_client/src/views/submit_page.dart';
import 'package:tembo_client/tembo_client.dart';

import '../components/bottom_nav_bar_button.dart';
import '../components/exports.dart';
import '../components/form/form.dart';
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

  String? dateError;

  final formKey = GlobalKey<TemboFormState>();

  @override
  void initState() {
    super.initState();

    firstNameController.text = dataManager.value.firstName ?? "";
    lastNameController.text = dataManager.value.lastName ?? "";
    date = dataManager.value.dob;

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
      body: TemboForm(
        key: formKey,
        child: ListView(
          padding: kPagePadding,
          children: [
            const PageTitle(title: "Basic Info"),
            const SizedBox(height: 15),
            TemboTextField(
              controller: firstNameController,
              textCapitalization: TextCapitalization.words,
              hint: "First Name",
              validator: validateName,
            ),
            const SizedBox(height: 15),
            TemboTextField(
              controller: lastNameController,
              textCapitalization: TextCapitalization.words,
              hint: "Last Name",
              validator: validateName,
            ),
            const SizedBox(height: 15),
            TemboDatePicker(
              value: date,
              onSelected: onDateSelected,
              error: dateError,
              hint: "Date of Birth",
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarButton(
        callback: getPlatfromVersion,
      ),
    );
  }

  void getPlatfromVersion() async {
    final valid = validate();
    if (!valid) return;

    dataManager.updateFirstName(firstNameController.compactText!);
    dataManager.updateLastName(lastNameController.compactText!);
    dataManager.updateDOB(date!);

    push(context, page: const GenderPickPage());
  }

  bool validate() {
    final hasNoFormErrors = formKey.currentState?.validate() ?? false;

    if (date == null) {
      dateError = "Date of birth is required";
      setState(() {});
      return false;
    }

    final now = DateTime.now();
    final diff = date!.difference(now);
    if (!diff.isNegative) {
      dateError = "We don't support people born from the future.";
      setState(() {});
      return false;
    }

    if (diff.abs().inDays < 18 * 365) {
      dateError = "You must be at least 18 years old!";
      setState(() {});
      return false;
    }

    return hasNoFormErrors;
  }

  void onDateSelected(DateTime value) {
    date = value;
    dateError = null;
    setState(() {});
  }
}
