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
                onPressed: () {
                  startTemboVerification(
                    context,
                    userData: UserData(
                      userId: "user-id",
                      country: Country.kenya(),
                      gender: Gender.male,
                      firstName: "Okello",
                      lastName: "Gerald",
                      dob: DateTime(1998),
                      document: VerDocument(
                        type: VerDocumentType.driverLicense,
                        issueDate: DateTime.now(),
                        expiryDate: DateTime.now(),
                        idNumber: "2836464744784",
                      ),
                    ),
                    /*   colorScheme: const TemboColorScheme(
                      primary: Color(0xff3066BE),
                      // primary: Colors.red,
                      onPrimary: Colors.white,
                      border: Colors.black,
                      onBackground: Colors.black,
                      title: Colors.black26,
                      error: Colors.blueAccent,
                    ), */

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
