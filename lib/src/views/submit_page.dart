import 'package:flutter/material.dart';
import 'package:tembo_client/src/components/exports.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Container(
          constraints: const BoxConstraints.expand(),
          child: StreamBuilder(
              initialData: smilePlugin.value,
              stream: smilePlugin.onStateChanged,
              builder: (context, snapshot) {
                final state = snapshot.data;
                if (state == null) return Container();
                if (state.hasError) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TemboText(state.error!),
                      const SizedBox(height: 10),
                      TemboTextButton(
                        style: const TemboButtonStyle(),
                        child: const TemboText("Check Your Details"),
                        onPressed: () {
                          pop(context);
                        },
                      )
                    ],
                  );
                }
                if (state.submitted) {
                  return Column(
                    children: [
                      const TemboText(
                        "We have submitted your project",
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
                }
                if (state.captured) {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TemboText(
                        "We are submitting your project",
                      ),
                      SizedBox(height: 10),
                      TemboLoadingIndicator()
                    ],
                  );
                }
                return Container();
              })),
    );
  }
}
