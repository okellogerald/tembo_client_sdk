import 'package:flutter/material.dart';
import 'package:tembo_client_sdk/src/components/chip_picker.dart';
import 'package:tembo_client_sdk/src/widgets/page_title.dart';
import 'package:tembo_client_sdk/src/constants/constants.dart';
import 'package:tembo_client_sdk/src/models/country.dart';
import 'package:tembo_client_sdk/tembo_client_sdk.dart';

import '../components/bottom_nav_bar_button.dart';
import '../utils/navigation_utils.dart';
import '../widgets/validation_error_view.dart';

class CountryPickPage extends StatefulWidget {
  const CountryPickPage({super.key});

  @override
  State<CountryPickPage> createState() => _CountryPickPageState();
}

class _CountryPickPageState extends State<CountryPickPage> {
  Country? country;
  String? error;

  @override
  void initState() {
    super.initState();
    country = dataManager.value.country;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: kPagePadding,
        child: ListView(
          children: [
            const PageTitle(title: "Choose Your Country"),
            const SizedBox(height: 15),
            TemboPicker2(
              options: supportedCountries,
              onChange: onCountrySelected,
              selected: (d) => d == country,
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
        callback: next,
      ),
    );
  }

  void next() async {
    final valid = validate();
    if (!valid) return;

    dataManager.updateCountry(country!);
    push(context, page: const BasicInfoPage());
  }

  void onCountrySelected(Country value) {
    country = value;
    error = null;
    setState(() {});
  }

  bool validate() {
    final valid = country != null;

    if (!valid) {
      error = "Country is required";
      setState(() {});
    }

    return valid;
  }
}
