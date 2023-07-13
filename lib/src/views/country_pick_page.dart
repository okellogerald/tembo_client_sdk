import 'package:flutter/material.dart';
import 'package:tembo_client/src/components/chip_picker.dart';
import 'package:tembo_client/src/constants/styles.dart';
import 'package:tembo_client/src/models/country.dart';
import 'package:tembo_client/src/styles/source.dart';
import 'package:tembo_client/tembo_client.dart';

import '../components/bottom_nav_bar_button.dart';
import '../components/exports.dart';
import '../utils/navigation_utils.dart';

class CountryPickPage extends StatefulWidget {
  const CountryPickPage({super.key});

  @override
  State<CountryPickPage> createState() => _CountryPickPageState();
}

class _CountryPickPageState extends State<CountryPickPage> {
  Country? country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TemboText("Choose Your Country"),
      ),
      body: Padding(
        padding: kPagePadding,
        child: Column(
          children: [
            TemboPicker2(
              options: supportedCountries,
              onChange: onCountrySelected,
              selected: (d) => d == country,
              label: (d) => d.name,
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
    push(context, page: const BasicInfoPage());
  }

  void onCountrySelected(Country value) {
    country = value;
    setState(() {});
  }
}
