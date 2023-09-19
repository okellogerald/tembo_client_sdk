import 'package:tembo_client_sdk/src/views/source.dart';

class BottomNavBarButton extends StatelessWidget {
  final VoidCallback callback;
  final String? text;
  const BottomNavBarButton({
    super.key,
    required this.callback,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ThemeDataWrapper(builder: (context, theme) {
        final style = theme.bottomNavBarButtonStyle.copyWith(
          foregroundColor: theme.colorScheme.onPrimary,
        );
        return TemboTextButton(
          onPressed: callback,
          style: style,
          child: TemboText(text ?? TemboTexts.actionsNext),
        );
      }),
    );
  }
}
