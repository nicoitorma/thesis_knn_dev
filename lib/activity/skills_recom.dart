import 'package:flutter/material.dart';
import 'package:th_knn/drawables/bg.dart';
import 'package:th_knn/layouts/header.dart';

class SkillsRecom extends StatelessWidget {
  const SkillsRecom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const Stack(
          children: [BackgroundImage(), Header()],
        ));
  }
}
