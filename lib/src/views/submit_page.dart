import 'package:tembo_client_sdk/src/views/data_verify_page.dart';
import 'package:tembo_client_sdk/tembo_client_sdk.dart';

import "source.dart";
import 'toc_page.dart';

/// Submission page. Let's the user know of whatever is happening after the verification process has
/// started
class SubmitPage extends StatefulWidget {
  static const routeName = "submit_page";
  const SubmitPage({super.key});

  @override
  State<SubmitPage> createState() => _SubmitPageState();
}

class _SubmitPageState extends State<SubmitPage> {
  @override
  Widget build(BuildContext context) {
    return TemboScaffold(builder: (context, theme) {
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
                      TemboTexts.submissionInProgressDesc,
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
                      TemboTexts.submissionSuccessDesc,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    TemboTextButton(
                      style: theme.defaultButtonStyle,
                      onPressed: removeSDKScreens,
                      child: const TemboText(TemboTexts.actionsClose),
                    )
                  ],
                );
              },
              error: (message) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TemboText(
                      TemboTexts.submissionFailedDesc,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    TemboText(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: theme.colorScheme.onBackground?.withOpacity(.7),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TemboTextButton(
                      style: theme.defaultButtonStyle,
                      onPressed: tryAgain,
                      child: const TemboText(TemboTexts.actionsTryAgain),
                    )
                  ],
                );
              },
            );
          },
        ),
      );
    });
  }

  void removeSDKScreens() {
    popUntil(context, routeName: TOCPage.routeName);
    pop(context);
  }

  void tryAgain() async {
    final data = smilePlugin.value.data;
    if (data == null) {
      popUntil(context, routeName: DataVerifyPage.routeName);
      return;
    }
    popUntil(context, routeName: DataVerifyPage.routeName);
    await smilePlugin.retry(data);
  }
}
