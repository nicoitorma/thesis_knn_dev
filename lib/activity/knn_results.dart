import 'package:flutter/material.dart';
import 'package:th_knn/drawables/bg.dart';
import 'package:th_knn/layouts/header.dart';
import 'package:th_knn/utils/knn_classifier.dart';

class KnnResult extends StatefulWidget {
  final List<List> grades;
  final String program;

  const KnnResult({super.key, required this.program, required this.grades});

  @override
  State<KnnResult> createState() => _KnnResultState();
}

class _KnnResultState extends State<KnnResult> {
  final knnAlgo = KnnAlgorithm();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0.0),
      body: Stack(children: [
        const BackgroundImage(),
        const Header(),
        FutureBuilder(
            future: knnAlgo.getResults(widget.program, widget.grades),
            builder: ((context, snapshot) {
              return const Text('');
            }))
      ]),
    );
  }
}
