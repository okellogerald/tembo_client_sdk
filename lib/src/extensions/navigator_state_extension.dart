import 'package:flutter/material.dart';

extension NavigatorExtension on GlobalKey<NavigatorState> {
  Future push(Widget page) async {
    return await currentState!.push(_createRouteFor(page));
  }

  dynamic pop([result]) {
    currentState!.pop(result);
  }

  void popToFirstPage() {
    currentState!.popUntil((route) => route.isFirst);
  }

  void removeAllAndPush(Widget page) {
    currentState!.pushAndRemoveUntil(_createRouteFor(page), (route) => false);
  }
}

PageRouteBuilder _createRouteFor(Widget page) {
  return _SlideRightRoute(page: page);
}

class _SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  _SlideRightRoute({required this.page})
      : super(pageBuilder: (_, __, ___) {
          return page;
        }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(10.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        });
}
