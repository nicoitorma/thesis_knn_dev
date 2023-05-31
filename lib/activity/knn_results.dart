import 'package:flutter/material.dart';
import 'package:th_knn/drawables/bg.dart';
import 'package:th_knn/layouts/box_decoration.dart';
import 'package:th_knn/layouts/header.dart';
import 'package:th_knn/layouts/result.dart';
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
    Map<dynamic, int> countMap = {};
    final List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
      Colors.amber,
      Colors.brown
    ];

    countOccurence(List list) {
      for (var label in list) {
        countMap[label] = (countMap[label] ?? 0) + 1;
      }
    }

    sortLabel() {
      return countMap.keys.toList()
        ..sort((a, b) => countMap[b]!.compareTo(countMap[a]!));
    }

    return Scaffold(
        appBar: AppBar(toolbarHeight: 0.0),
        body: Stack(children: [
          const BackgroundImage(),
          const Header(headerTitle: 'Your Results'),
          Positioned.fill(
            top: 130,
            bottom: 20,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FutureBuilder(
                  future: knnAlgo.getResults(widget.program, widget.grades),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      List list = snapshot.data;
                      countOccurence(list);
                      List sortedLabels = sortLabel();
                      return ListView.builder(
                          itemCount: sortedLabels.length,
                          itemBuilder: (context, index) {
                            Color color = colors[index];
                            String value = sortedLabels[index];
                            return Container(
                              decoration: tableBoxDecor(),
                              child: Column(children: [
                                Results(color: color, result: value)
                              ]),
                            );
                          });
                    }
                    return const CircularProgressIndicator();
                  })),
            ),
          )
        ]));
  }
}
