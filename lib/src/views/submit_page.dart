import 'package:flutter/material.dart';
import 'package:tembo_client/src/components/exports.dart';
import 'package:tembo_client/src/extensions/context_extension.dart';
import 'package:tembo_client/src/extensions/textstyle_extension.dart';
import 'package:tembo_client/src/styles/button_styles.dart';
import 'package:tembo_client/src/utils/navigation_utils.dart';
import 'package:tembo_client/tembo_client.dart';

class SubmitPage extends StatefulWidget {
  const SubmitPage({super.key});

  @override
  State<SubmitPage> createState() => _SubmitPageState();
}

class _SubmitPageState extends State<SubmitPage> {
  @override
  void initState() {
    super.initState();
  }

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
                      "We are submitting your job",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    TemboLoadingIndicator()
                  ],
                );
              },
              submitted: () {
                return Column(
                  children: [
                    const TemboText(
                      "We have submitted your job",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    TemboTextButton(
                      child: const TemboText("Close"),
                      onPressed: () {
                        pop(context);
                        pop(context);
                      },
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
                    const SizedBox(height: 10),
                    TemboTextButton(
                      style: TemboButtonStyle(
                        textStyle: context.textTheme.bodyMedium.withFW600,
                      ),
                      onPressed: next,
                      child: const TemboText("Try Again"),
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

  void next() async {
    final data = smilePlugin.value.data;
    if (data == null) {
      showErrorSnackbar(
        context,
        "Looks like you need to start the process again.",
      );
      return;
    }
    await smilePlugin.capture(data);
  }
}
