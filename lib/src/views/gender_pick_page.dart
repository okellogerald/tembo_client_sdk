import 'package:flutter/material.dart';
import 'package:tembo_client/src/components/bottom_nav_bar_button.dart';
import 'package:tembo_client/src/components/chip_picker.dart';
import 'package:tembo_client/src/widgets/page_title.dart';
import 'package:tembo_client/src/constants/constants.dart';
import 'package:tembo_client/src/models/gender.dart';
import 'package:tembo_client/src/views/id_page.dart';

import '../../tembo_client.dart';
import '../utils/navigation_utils.dart';
import '../widgets/validation_error_view.dart';

class GenderPickPage extends StatefulWidget {
  const GenderPickPage({super.key});

  @override
  State<GenderPickPage> createState() => _GenderPickPageState();
}

class _GenderPickPageState extends State<GenderPickPage> {
  Gender? gender;
  String? error;

    @override
  void initState() {
    super.initState();
    gender = dataManager.value.gender;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: kPagePadding,
        child: ListView(
          children: [
            const PageTitle(title: "Choose Your Gender"),
            const SizedBox(height: 15),
            TemboPicker2(
              options: Gender.values,
              onChange: onGenderSelected,
              selected: (d) => d == gender,
              label: (d) => d.name,
            ),
            const SizedBox(height: 20),
            ValidationErrorView(
              error: error,
            )
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

    dataManager.updateGender(gender!);
    push(context, page: const IDPage());
  }

  void onGenderSelected(Gender value) {
    gender = value;
    error = null;
    setState(() {});
  }

  bool validate() {
    final valid = gender != null;

    if (!valid) {
      error = "Gender is required";
      setState(() {});
    }

    return valid;
  }
}
