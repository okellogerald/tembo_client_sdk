import 'package:flutter/material.dart';
import 'package:tembo_client/tembo_client.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "circular",
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
              fontFamily: "circular",
            ),
          )),
      home: Scaffold(
        body: Builder(builder: (context) {
          return Center(
            child: TextButton(
              onPressed: () {
                final route = MaterialPageRoute(
                    builder: (context) => const BasicInfoPage());
                Navigator.of(context).push(route);
              },
              child: Text("Start"),
            ),
          );
        }),
      ),
    );
  }
}
