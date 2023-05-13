import 'package:flutter/material.dart';
import 'package:th_knn/drawables/bg.dart';
import 'package:th_knn/layouts/header.dart';
import 'package:th_knn/values/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CICT KNN Career Guidance',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
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
    return Scaffold(
        appBar: AppBar(toolbarHeight: 0.0),
        body: Stack(children: [
          backgroundImage,
          const Header(),
          Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 229.0,
                height: 112.0,
                decoration: BoxDecoration(
                  color: const Color(0xb2ffffff),
                  borderRadius: BorderRadius.circular(32.0),
                  border:
                      Border.all(width: 5.0, color: const Color(0xb2707070)),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    btn1,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: 229.0,
                height: 112.0,
                decoration: BoxDecoration(
                  color: const Color(0xb2ffffff),
                  borderRadius: BorderRadius.circular(32.0),
                  border:
                      Border.all(width: 5.0, color: const Color(0xb2707070)),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    btn2,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: 229.0,
                height: 112.0,
                decoration: BoxDecoration(
                  color: const Color(0xb2ffffff),
                  borderRadius: BorderRadius.circular(32.0),
                  border:
                      Border.all(width: 5.0, color: const Color(0xb2707070)),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    btn3,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                ),
              )
            ]),
          )
        ]));
  }
}
