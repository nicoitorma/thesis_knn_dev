import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:th_knn/drawables/bg.dart';
import 'package:th_knn/layouts/header.dart';
import 'package:th_knn/layouts/text_style.dart';
import 'package:th_knn/controllers/knn_helper.dart';
import 'package:th_knn/values/strings.dart';

import '../layouts/barchart.dart';
import '../layouts/box_decoration.dart';
import '../layouts/result.dart';
import '../models/grades.dart';
import '../controllers/rate_prediction.dart';

class KnnResult extends StatefulWidget {
  final List<Grades> gradesList;
  final List grades;
  final String program;
  final String idNum;

  const KnnResult(
      {super.key,
      required this.gradesList,
      required this.program,
      required this.grades,
      required this.idNum});

  @override
  State<KnnResult> createState() => _KnnResultState();
}

class _KnnResultState extends State<KnnResult> {
  final knnAlgo = KnnHelper();
  double predRating = 4;
  String? expectedCareer;
  List occurence = [];
  Map<dynamic, int> countMap = {};
  final careerCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    careerCtrl.dispose();
    super.dispose();
  }

  Widget rateButton() {
    return Container(
      decoration: checkResBoxDecor(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Text(
          labelRateTitle,
          style: customTextStyle(size: 20.0, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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

    countOccurence(list) {
      for (var label in list) {
        countMap[label] = (countMap[label] ?? 0) + 1;
      }

      return countMap.keys.toList()
        ..sort((a, b) => countMap[b]!.compareTo(countMap[a]!));
    }

    String highestValueKey(Map<dynamic, int> data) {
      int maxValue = 0;
      String keyWithMaxValue = '';

      data.forEach((key, value) {
        if (value > maxValue) {
          maxValue = value;
          keyWithMaxValue = key;
        }
      });

      return keyWithMaxValue;
    }

    return Scaffold(
        appBar: AppBar(toolbarHeight: 0.0),
        body: Stack(children: [
          const BackgroundImage(),
          Header(headerTitle: labelYourRes),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 100, 8.0, 0),
            child: FutureBuilder(
                future: knnAlgo.getResults(widget.program, widget.grades),
                builder: ((context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done) {
                    var list = snapshot.data;
                    occurence = countOccurence(list);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
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
                        Flexible(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: occurence.length,
                              itemBuilder: (context, index) {
                                String value = countMap.keys.toList()[index];
                                Color color = colors[index];
                                return Container(
                                  decoration: tableBoxDecor(),
                                  child: Column(children: [
                                    Results(color: color, result: value)
                                  ]),
                                );
                              }),
                        ),
                      ],
                    );
                  }
                  return const SizedBox(
                      height: 50,
                      width: 50,
                      child: Center(child: CircularProgressIndicator()));
                })),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 10),
                child: InkWell(
                    child: rateButton(),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      saveGradeToOnline(
                                          widget.gradesList,
                                          widget.program,
                                          widget.idNum,
                                          expectedCareer ??
                                              highestValueKey(countMap));
                                    },
                                    child: Text(labelOk)),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(labelCancel)),
                              ],
                              content:
                                  StatefulBuilder(builder: (context, setState) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(labelRateTitle,
                                        style: customTextStyle(size: 18.0)),
                                    Text(labelRateDesc,
                                        style: customTextStyle(size: 14.0)),
                                    SmoothStarRating(
                                        rating: predRating,
                                        size: 30,
                                        filledIconData: Icons.star,
                                        halfFilledIconData: Icons.star_half,
                                        defaultIconData: Icons.star_border,
                                        starCount: 5,
                                        color: Colors.blue,
                                        borderColor: Colors.blue,
                                        allowHalfRating: false,
                                        spacing: 2.0,
                                        onRatingChanged: (value) {
                                          setState(() {
                                            predRating = value;
                                          });
                                        }),
                                    if (predRating < 3)
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: TextField(
                                          controller: careerCtrl,
                                          onChanged: (value) {
                                            if (value.isNotEmpty) {
                                              expectedCareer = value.toString();
                                            }
                                          },
                                          style: customTextStyle(size: 20.0),
                                          decoration: InputDecoration(
                                              border:
                                                  const OutlineInputBorder(),
                                              hintText: labelExpectedCareer,
                                              hintStyle: const TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 18)),
                                        ),
                                      )
                                  ],
                                );
                              }),
                            );
                          });
                    }),
              ))
        ]));
  }
}
