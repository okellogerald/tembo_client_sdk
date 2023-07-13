library tembo_client;

import 'package:flutter/material.dart';
import 'package:smile_identity_plugin/smile_identity_plugin.dart';
import 'package:tembo_client/src/utils/navigation_utils.dart';
import 'package:tembo_client/src/views/country_pick_page.dart';

export 'src/views/basic_info_page.dart';

Future<String> getPlatformVersion() async {
  final plugin = SmileIdentityPlugin();
  return (await plugin.getPlatformVersion()) ?? "Unknown platform";
}

void startTemboVerification(BuildContext context) {
  push(context, page: const CountryPickPage());
}
