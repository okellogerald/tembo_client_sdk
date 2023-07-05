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
          primaryColor: Colors.black,
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
        body: Builder(
          builder: (context) {
            return Center(
              child: TextButton(
                onPressed: () {
                  final route = MaterialPageRoute(
                      builder: (context) => const BasicInfoPage());
                  Navigator.of(context).push(route);
                },
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    shape: const RoundedRectangleBorder(side: BorderSide())),
                child: const Text(
                  "START",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
