import 'package:flutter/material.dart';
import 'package:th_knn/drawables/bg.dart';
import 'package:th_knn/layouts/header.dart';
import 'package:th_knn/layouts/text_style.dart';
import 'package:th_knn/utils/knn_classifier.dart';
import 'package:th_knn/values/strings.dart';

import '../layouts/barchart.dart';
import '../layouts/box_decoration.dart';
import '../layouts/result.dart';

class KnnResult extends StatefulWidget {
  final List grades;
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
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.purple,
      Colors.amber,
      Colors.brown
    ];

    sortLabel(list) {
      for (var label in list) {
        countMap[label] = (countMap[label] ?? 0) + 1;
      }

      return countMap.keys.toList()
        ..sort((a, b) => countMap[b]!.compareTo(countMap[a]!));
    }

    return Scaffold(
        appBar: AppBar(toolbarHeight: 0.0),
        body: Stack(children: [
          const BackgroundImage(),
          const Header(headerTitle: 'Your Results'),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 150, 10.0, 0),
            child: FutureBuilder(
                future: knnAlgo.getResults(widget.program, widget.grades),
                builder: ((context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done) {
                    var list = snapshot.data;
                    List sortedLabels = sortLabel(list);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                            child: Container(
                                decoration: tableBoxDecor(),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0.0, 20, 0, 0),
                                  child: BarChartWidget(
                                      data: countMap, colors: colors),
                                ))),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(legends,
                              textAlign: TextAlign.start,
                              style: customTextStyle()),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: sortedLabels.length,
                            itemBuilder: (context, index) {
                              String value = sortedLabels[index];
                              Color color = colors[sortedLabels.indexOf(value)];

                              return Container(
                                decoration: tableBoxDecor(),
                                child: Column(children: [
                                  Results(
                                      color: color, result: sortedLabels[index])
                                ]),
                              );
                            }),
                      ],
                    );
                  }
                  return const SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator());
                })),
          ),
        ]));
  }
}
