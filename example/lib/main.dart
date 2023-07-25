import 'package:flutter/material.dart';
import 'package:tembo_client_sdk/tembo_client_sdk.dart';

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
          appBarTheme: AppBarTheme(
            iconTheme: const IconThemeData(color: Colors.black),
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            titleTextStyle: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              fontFamily: "circular",
              color: Colors.black87,
            ),
          )),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Application 1"),
        ),
        body: Builder(
          builder: (context) {
            return Center(
              child: TextButton(
                onPressed: () async {
                  startTemboVerification(
                    context,
                    userData: Data(
                      userId: "user-3",
                      /*  country: Country.tz(),
                      gender: Gender.female,
                      firstName: "Jane",
                      lastName: "Doe",
                      dob: DateTime(1995),
                      document: VerDocument(
                        type: VerDocumentType.nida,
                        issueDate: DateTime.now(),
                        expiryDate: DateTime.now(),
                        idNumber: "2836464744784",
                      ), */
                    ),
                    locale: TemboLocale.sw,
                    colorScheme: const TemboColorScheme(
                      primary: Colors.red,
                    ),
                    fontFamily: "circular",
                  );
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
