import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:th_knn/screen_sizes/phone_screen.dart';
import 'package:th_knn/screen_sizes/web_screen.dart';
import 'package:th_knn/values/strings.dart';

import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xb2ffffff)),
        useMaterial3: true,
        textTheme:
            const TextTheme(headlineLarge: TextStyle(color: Colors.white)),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //Check if screen size is > 650
    if (MediaQuery.of(context).size.width > 650) {
      return const WebScreen();
    }
    return const PhoneScreen();
  }
}
