import 'package:flutter/material.dart';
import 'package:th_knn/widgets/header.dart';
import 'package:th_knn/widgets/info_and_about.dart';
import 'package:th_knn/widgets/widgets_in_main.dart';

import '../backgrounds/bg.dart';
import '../backgrounds/bg1.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(toolbarHeight: 0.0),
        body: Stack(children: [
          const BackgroundImage(),
          const Header(size: 50),
          const Bg1(leftMargin: 90),
          mainContent(),
          const InfoAbout()
        ]));
  }
}
