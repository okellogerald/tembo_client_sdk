import 'package:smile_identity_plugin/smile_identity_plugin.dart';
import 'package:tembo_client_sdk/src/views/gender_pick_page.dart';
import 'package:tembo_client_sdk/src/views/submit_page.dart';
import 'package:tembo_client_sdk/tembo_client_sdk.dart';

import 'source.dart';

final smilePlugin = SmileIdentityPlugin();

/// Collects Basic User Information
class BasicInfoPage extends StatefulWidget {
  static const routeName = "basic_info";
  const BasicInfoPage({super.key});

  @override
  TemboState<BasicInfoPage> createState() => _BasicInfoPageState();
}

class _BasicInfoPageState extends TemboState<BasicInfoPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  DateTime? date;

  String? dateError;

  final formKey = GlobalKey<TemboFormState>();

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
        push(
          context,
          routeName: SubmitPage.routeName,
          page: const SubmitPage(),
        );
      }
    });
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    firstNameController.text = dataManager.value.firstName ?? "";
    lastNameController.text = dataManager.value.lastName ?? "";
    date = dataManager.value.dob;
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
            const PageTitle(title: TemboTexts.basicInfoPageTitle),
            const SizedBox(height: 15),
            TemboTextField(
              controller: firstNameController,
              textCapitalization: TextCapitalization.words,
              hint: TemboTexts.userFirstName,
              validator: validateName,
            ),
            const SizedBox(height: 15),
            TemboTextField(
              controller: lastNameController,
              textCapitalization: TextCapitalization.words,
              hint: TemboTexts.userLastName,
              validator: validateName,
            ),
            const SizedBox(height: 15),
            TemboDatePicker(
              value: date,
              onSelected: onDateSelected,
              error: dateError,
              hint: TemboTexts.userDOB,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarButton(
        callback: next,
      ),
    );
  }

  void next() async {
    final valid = validate();
    if (!valid) return;

    dataManager.updateFirstName(firstNameController.compactText!);
    dataManager.updateLastName(lastNameController.compactText!);
    dataManager.updateDOB(date!);

    push(
      context,
      routeName: GenderPickPage.routeName,
      page: const GenderPickPage(),
    );
  }

  bool validate() {
    final hasNoFormErrors = formKey.currentState?.validate() ?? false;

    if (date == null) {
      dateError = TemboTexts.errorsDOBRequired;
      setState(() {});
      return false;
    }

    final now = DateTime.now();
    final diff = date!.difference(now);
    if (!diff.isNegative) {
      dateError = TemboTexts.errorsDOBBornFromFuture;
      setState(() {});
      return false;
    }

    if (diff.abs().inDays < 18 * 365) {
      dateError = TemboTexts.errorsDOBAgeBelow18;
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
