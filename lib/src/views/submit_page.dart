import 'package:tembo_client_sdk/src/views/country_pick_page.dart';
import 'package:tembo_client_sdk/src/views/data_verify_page.dart';
import 'package:tembo_client_sdk/tembo_client_sdk.dart';

import "source.dart";

class SubmitPage extends StatefulWidget {
  static const routeName = "submit_page";
  const SubmitPage({super.key});

  @override
  State<SubmitPage> createState() => _SubmitPageState();
}

class _SubmitPageState extends State<SubmitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ThemeDataWrapper(builder: (context, theme) {
        final buttonStyle = _buttonStyle.copyWith(
          textStyle: TextStyle(
            fontFamily: theme.fontFamily,
            fontWeight: FontWeight.bold,
          ),
        );
        return Container(
          constraints: const BoxConstraints.expand(),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: StreamBuilder(
            initialData: smilePlugin.value,
            stream: smilePlugin.onStateChanged,
            builder: (context, snapshot) {
              final state = snapshot.data;
              if (state == null) return Container();

              return state.submitState.when(
                none: () => Container(),
                submitting: () {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TemboText(
                        "We are submitting your job",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      TemboLoadingIndicator()
                    ],
                  );
                },
                submitted: () {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TemboText(
                        "We have submitted your job",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      TemboTextButton(
                        style: buttonStyle,
                        onPressed: removeSDKScreens,
                        child: const TemboText("Close"),
                      )
                    ],
                  );
                },
                error: (message) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TemboText(
                        message,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      TemboTextButton(
                        style: buttonStyle,
                        onPressed: tryAgain,
                        child: const TemboText("Try Again"),
                      )
                    ],
                  );
                },
              );
            },
          ),
        );
      }),
    );
  }

  void removeSDKScreens() {
    popUntil(context, routeName: CountryPickPage.routeName);
    pop(context);
  }

  void tryAgain() async {
    final data = smilePlugin.value.data;
    if (data == null) {
      showErrorSnackbar(
        context,
        "Looks like you need to start the process again.",
      );
      return;
    }
    popUntil(context, routeName: DataVerifyPage.routeName);
    await smilePlugin.retry(data);
  }
}

const _buttonStyle = TemboButtonStyle.outline(
  borderRadius: 30,
  borderWidth: 2,
  padding: kHorPadding,
  borderColor: TemboColors.onBackground,
  foregroundColor: TemboColors.onBackground,
);
