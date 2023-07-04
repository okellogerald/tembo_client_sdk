library tembo_client;

import 'package:smile_identity_plugin/smile_identity_plugin.dart';

export 'src/views/basic_info_page.dart';

Future<String> getPlatformVersion() async {
  final plugin = SmileIdentityPlugin();
  return (await plugin.getPlatformVersion()) ?? "Unknown platform";
}
