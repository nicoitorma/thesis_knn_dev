import 'package:flutter/material.dart';
import 'package:th_knn/drawables/bg.dart';
import 'package:th_knn/layouts/header.dart';
import 'package:th_knn/utils/knn_classifier.dart';

import '../models/grades.dart';

class KnnResult extends StatefulWidget {
  final List<Grades> grades;

  const KnnResult({super.key, required this.grades});

  @override
  State<KnnResult> createState() => _KnnResultState();
}

class _KnnResultState extends State<KnnResult> {
  var results;

  @override
  void initState() {
    final knnAlgo = KnnAlgorithm();
    results = knnAlgo.getResults(widget.grades);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0.0),
      body: Stack(children: [
        const BackgroundImage(),
        const Header(),
        Column(
          children: [Text(results.toString())],
        )
      ]),
    );
  }
}
