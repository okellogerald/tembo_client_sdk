import 'package:tembo_client_sdk/src/views/country_pick_page.dart';
import 'package:tembo_client_sdk/src/views/source.dart';
import 'package:url_launcher/url_launcher.dart';

/// Prompts the user to agree to TemboPlus's Terms & Conditions
class TOCPage extends StatefulWidget {
  static const routeName = "toc_page";
  const TOCPage({super.key});

  @override
  State<TOCPage> createState() => _TOCPageState();
}

class _TOCPageState extends State<TOCPage> {
  bool agreedToTOC = false;

  @override
  Widget build(BuildContext context) {
    return ThemeDataWrapper(builder: (context, theme) {
      return Scaffold(
        backgroundColor: theme.colorScheme.scaffoldBackground,
        appBar: AppBar(),
        extendBodyBehindAppBar: true,
        body: Container(
          constraints: const BoxConstraints.expand(),
          child: ThemeDataWrapper(builder: (context, theme) {
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: kHorPadding,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Image.asset(
                          "assets/images/ic_launcher_round.png",
                          package: "tembo_client_sdk",
                          height: 150,
                        ),
                        const SizedBox(height: 20),
                        const TemboText("TEMBO PLUS INC."),
                        const SizedBox(height: 10),
                        TemboText(
                          TemboTexts.tocPageDesc,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: theme.colorScheme.body,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TemboTextButton(
                          onPressed: showTOC,
                          style: theme.defaultButtonStyle,
                          child: const TemboText(TemboTexts.actionsReadTOC),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: kHorPadding.right),
                  child: Row(
                    children: [
                      Checkbox.adaptive(
                        value: agreedToTOC,
                        onChanged: updateAgreeStatus,
                        checkColor: theme.colorScheme.onPrimary,
                        fillColor: agreedToTOC
                            ? MaterialStatePropertyAll(
                                theme.colorScheme.primary)
                            : null,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: TemboText(
                          TemboTexts.tocPageAgreeConfirmDesc,
                          style: TextStyle(fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
        bottomNavigationBar: agreedToTOC
            ? BottomNavBarButton(
                callback: agree,
              )
            : const _Button(),
      );
    });
  }

  void updateAgreeStatus(bool? value) {
    if (value == null) return;
    setState(() => agreedToTOC = value);
  }

  void agree() {
    push(
      context,
      page: const CountryPickPage(),
      routeName: CountryPickPage.routeName,
    );
  }

  void showTOC() async {
    try {
      launchUrl(Uri.parse("https://www.temboplus.com/app/privacy.html"));
    } catch (e) {
      showErrorSnackbar(context, "$e");
    }
  }
}

class _Button extends StatelessWidget {
  const _Button();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ThemeDataWrapper(builder: (context, theme) {
        return TemboTextButton(
          onPressed: () {},
          style: theme.bottomNavBarButtonStyle.copyWith(
            backgroundColor: Colors.grey,
            foregroundColor: Colors.white,
          ),
          child: const TemboText(TemboTexts.actionsNext),
        );
      }),
    );
  }
}
