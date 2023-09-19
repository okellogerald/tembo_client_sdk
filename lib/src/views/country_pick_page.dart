import 'package:tembo_client_sdk/tembo_client_sdk.dart';

import 'source.dart';

/// User picks the country
class CountryPickPage extends StatefulWidget {
  static const routeName = "country_pick";
  const CountryPickPage({super.key});

  @override
  TemboState<CountryPickPage> createState() => _CountryPickPageState();
}

class _CountryPickPageState extends TemboState<CountryPickPage> {
  Country? country;
  String? error;

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    country = dataManager.value.country;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ThemeDataWrapper(builder: (context, theme) {
      return Scaffold(
        appBar: AppBar(),
        backgroundColor: theme.colorScheme.scaffoldBackground,
        body: Padding(
          padding: kPagePadding,
          child: ListView(
            children: [
              const PageTitle(title: TemboTexts.countryChoosePageTitle),
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
    });
  }

  void next() async {
    final valid = validate();
    if (!valid) return;

    dataManager.updateCountry(country!);
    push(
      context,
      routeName: BasicInfoPage.routeName,
      page: const BasicInfoPage(),
    );
  }

  void onCountrySelected(Country value) {
    country = value;
    error = null;
    setState(() {});
  }

  bool validate() {
    final valid = country != null;

    if (!valid) {
      error = TemboTexts.errorsCountryRequired;
      setState(() {});
    }

    return valid;
  }
}
