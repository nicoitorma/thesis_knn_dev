import 'package:flutter/material.dart';
import 'package:th_knn/drawables/bg.dart';
import 'package:th_knn/layouts/header.dart';
import 'package:th_knn/utils/knn_classifier.dart';

import 'cs.dart';

class KnnResult extends StatefulWidget {
  List<List>? grades;

  KnnResult({super.key, this.grades});

  @override
  State<KnnResult> createState() => _KnnResultState();
}

class _KnnResultState extends State<KnnResult> {
  final knnAlgo = KnnAlgorithm();
  String? result;

  @override
  void initState() {
    print(widget.grades);
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
            future: TrainKNN().train(),
            builder: ((context, snapshot) {
              return const Center(
                child: Text(''),
              );
            }))
      ]),
    );
  }
}
