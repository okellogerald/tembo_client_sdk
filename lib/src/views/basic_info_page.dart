import 'package:flutter/material.dart';

import '../components/exports.dart';
import '../theme/source.dart';

class BasicInfoPage extends StatefulWidget {
  const BasicInfoPage({super.key});

  @override
  State<BasicInfoPage> createState() => _BasicInfoPageState();
}

class _BasicInfoPageState extends State<BasicInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme,
      child: Scaffold(
        body: Column(
          children: [
            TemboText("Basic Info Page"),
            TemboTextButton(
              onPressed: () {
                print("hello!");
              },
              child: TemboText("Click Me!"),
            )
          ],
        ),
      ),
    );
  }
}
