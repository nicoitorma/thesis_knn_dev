import 'package:flutter/material.dart';
import 'package:th_knn/backgrounds/bg.dart';
import 'package:th_knn/backgrounds/bg1.dart';
import 'package:th_knn/widgets/header.dart';
import 'package:th_knn/widgets/info_and_about.dart';
import 'package:th_knn/widgets/widgets_in_main.dart';
import 'package:th_knn/widgets/text_style.dart';

class WebScreen extends StatefulWidget {
  const WebScreen({super.key});

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          const Header(size: 80),
          const Bg1(
            leftMargin: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 50, right: 50),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      Text('Discover Your Possibilities',
                          style: headerTextStyle()),
                    ],
                  ),
                ),
                Expanded(flex: 1, child: mainContent())
              ],
            ),
          ),
          const InfoAbout()
        ],
      ),
    );
  }
}
