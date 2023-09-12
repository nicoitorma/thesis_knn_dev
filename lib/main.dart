import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:th_knn/activity/check_career.dart';
import 'package:th_knn/activity/skills_recom.dart';
import 'package:th_knn/drawables/bg.dart';
import 'package:th_knn/widgets/about.dart';
import 'package:th_knn/widgets/box_decoration.dart';
import 'package:th_knn/widgets/header.dart';
import 'package:th_knn/widgets/help.dart';
import 'package:th_knn/widgets/text_style.dart';
import 'package:th_knn/values/strings.dart';
import 'package:url_launcher/url_launcher.dart';

import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  // initialize the database
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CICT Career Guidance',
      debugShowCheckedModeBanner: false,
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
  container(String text) => Container(
        width: 229.0,
        height: 112.0,
        decoration: customBoxDecor(),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: customTextStyle(size: 20.0),
            textAlign: TextAlign.center,
            softWrap: false,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    const Duration duration = Duration(milliseconds: 300);
    return Scaffold(
        appBar: AppBar(toolbarHeight: 0.0),
        body: Stack(children: [
          const BackgroundImage(),
          const Header(headerTitle: 'Good Day, User!'),
          Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              InkWell(
                borderRadius: BorderRadius.circular(20.0),
                onTap: () async {
                  String url = 'https://th-grp.github.io/cict-cog';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    const CircularProgressIndicator();
                    await launchUrl(Uri.parse(url),
                        mode: LaunchMode.platformDefault);
                  }
                },
                child: Container(
                  width: 229.0,
                  height: 112.0,
                  decoration: customBoxDecor(),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      btn1,
                      style: customTextStyle(size: 20.0),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () => Navigator.of(context).push(PageTransition(
                    type: PageTransitionType.rightToLeftJoined,
                    child: const CheckCareer(),
                    duration: duration,
                    reverseDuration: duration,
                    childCurrent: widget)),
                child: container(btn2),
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () => Navigator.of(context).push(PageTransition(
                    type: PageTransitionType.rightToLeftJoined,
                    child: const SkillsRecom(),
                    duration: duration,
                    reverseDuration: duration,
                    childCurrent: widget)),
                child: container(btn3),
              ),
            ]),
          ),
          Positioned(
              bottom: 10,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () async {
                        if (kIsWeb) {
                          String url =
                              'https://nicoitorma.github.io/ocg-knn/ocg-about.html';
                          if (await canLaunchUrl(Uri.parse(url))) {
                            const CircularProgressIndicator();
                            await launchUrl(Uri.parse(url),
                                mode: LaunchMode.platformDefault);
                          }
                        } else {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const AboutScreen()));
                        }
                      },
                      icon: const Icon(Icons.info)),
                  IconButton(
                      onPressed: () async {
                        if (kIsWeb) {
                          String url =
                              'https://nicoitorma.github.io/ocg-knn/ocg-help.html';
                          if (await canLaunchUrl(Uri.parse(url))) {
                            const CircularProgressIndicator();
                            await launchUrl(Uri.parse(url),
                                mode: LaunchMode.platformDefault);
                          }
                        } else {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const HelpScreen()));
                        }
                      },
                      icon: const Icon(Icons.help)),
                ],
              ))
        ]));
  }
}
