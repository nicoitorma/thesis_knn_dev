import 'package:flutter/material.dart';
import 'package:th_knn/drawables/bg.dart';
import 'package:th_knn/layouts/header.dart';
import 'package:th_knn/utils/knn_classifier.dart';
import 'package:th_knn/utils/standard_scaler.dart';

class KnnResult extends StatefulWidget {
  final List<List<double>> grades;

  const KnnResult({super.key, required this.grades});

  @override
  State<KnnResult> createState() => _KnnResultState();
}

class _KnnResultState extends State<KnnResult> {
  final knnAlgo = KnnAlgorithm();
  final scaler = StandardScaler();
  List<List> scaledData = [];

  @override
  void initState() {
    scaler.fit(widget.grades);
    scaledData = scaler.transform(widget.grades);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0.0),
      body: const Stack(children: [
        BackgroundImage(),
        Header(),
        // Column(
        //   children: [Text(results.toString())],
        // )
      ]),
    );
  }
}
