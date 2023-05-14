import 'package:flutter/material.dart';
import 'package:th_knn/activity/check_career.dart';
import 'package:th_knn/drawables/bg.dart';
import 'package:th_knn/layouts/header.dart';
import 'package:th_knn/layouts/screen4.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xb2ffffff)),
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
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (builder) => const screen4())),
                child: Container(
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
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (builder) => const CheckCareer())),
                child: Container(
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
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
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
                      color: Colors.black,
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
