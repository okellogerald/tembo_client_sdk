import 'package:tembo_client_sdk/src/views/source.dart';

class TemboScaffold extends StatelessWidget {
  final Widget? body;
  final Widget Function(BuildContext context, TemboThemeData themeData)?
      builder;
  final Widget? bottomNavigationBar;
  final bool extendBehindAppBar;
  final bool extendBody;

  const TemboScaffold({
    super.key,
    this.body,
    this.bottomNavigationBar,
    this.extendBehindAppBar = false,
    this.extendBody = false,
    this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeDataWrapper(
      builder: (context, themeData) {
        return DefaultTextStyle(
          style: TextStyle(color: themeData.colorScheme.body),
          child: Scaffold(
            extendBody: extendBody,
            appBar: AppBar(
              backgroundColor:
                  themeData.colorScheme.scaffoldBackground?.withOpacity(.5),
              elevation: 0,
              iconTheme: IconThemeData(
                color: themeData.colorScheme.body,
              ),
            ),
            backgroundColor: themeData.colorScheme.scaffoldBackground,
            body: builder == null ? body : builder!(context, themeData),
            bottomNavigationBar: bottomNavigationBar,
            extendBodyBehindAppBar: extendBehindAppBar,
          ),
        );
      },
    );
  }
}
