import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:stay_floripa/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const Placeholder();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          if (Platform.isIOS) {
            FirebaseMessaging.instance.requestPermission();
            FirebaseMessaging.instance.getToken().then((value) => print(value));
          }

          FirebaseAnalytics analytics = FirebaseAnalytics.instance;

          return MaterialApp(
            title: 'StayFloripa',
            debugShowCheckedModeBanner: false,
            navigatorObservers: [
              FirebaseAnalyticsObserver(analytics: analytics)
            ],
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: true,
              textTheme: GoogleFonts.poppinsTextTheme(),
            ),
            home: const HomePage(),
          );
        }

        return const Placeholder();
      },
    );
  }
}
