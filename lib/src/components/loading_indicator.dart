import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/platform_utils.dart';

class TemboLoadingIndicator extends StatelessWidget {
  final Color? color;
  const TemboLoadingIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return isIOS
        ? CupertinoActivityIndicator(color: color)
        : CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(color),
          );
  }
}
