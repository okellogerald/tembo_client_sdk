import 'package:tembo_client_sdk/src/views/data_verify_page.dart';
import 'package:tembo_client_sdk/tembo_client_sdk.dart';

import "source.dart";
import 'toc_page.dart';

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
      body: Container(
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
                      style: _buttonStyle,
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
                        color: _buttonStyle.foregroundColor?.withOpacity(.7),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TemboTextButton(
                      style: _buttonStyle,
                      onPressed: tryAgain,
                      child: const TemboText(TemboTexts.actionsTryAgain),
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
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

const _buttonStyle = TemboButtonStyle.outline(
  borderRadius: 30,
  borderWidth: 2,
  padding: kHorPadding,
  borderColor: TemboColors.onBackground,
  foregroundColor: TemboColors.onBackground,
  textStyle: TextStyle(fontWeight: FontWeight.bold),
);
