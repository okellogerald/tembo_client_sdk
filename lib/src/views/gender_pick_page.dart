import 'package:tembo_client_sdk/src/views/id_page.dart';

import '../../tembo_client_sdk.dart';
import 'source.dart';

class GenderPickPage extends StatefulWidget {
  const GenderPickPage({super.key});

  @override
  State<GenderPickPage> createState() => _GenderPickPageState();
}

class _GenderPickPageState extends TemboState<GenderPickPage> {
  Gender? gender;
  String? error;

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    gender = dataManager.value.gender;
    setState(() {});
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
        callback: next,
      ),
    );
  }

  void next() async {
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
