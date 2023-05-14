import 'package:flutter/material.dart';
import 'package:th_knn/drawables/bg.dart';
import 'package:th_knn/layouts/box_decoration.dart';
import 'package:th_knn/layouts/header.dart';
import 'package:th_knn/layouts/text_style.dart';
import 'package:th_knn/models/grades.dart';

import '../values/strings.dart';

class CheckCareer extends StatefulWidget {
  const CheckCareer({super.key});

  @override
  State<CheckCareer> createState() => _CheckCareerState();
}

class _CheckCareerState extends State<CheckCareer> {
  List<Grades> gradesList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0.0),
      body: Stack(
        children: [
          backgroundImage,
          const Header(),
          Positioned.fill(
            top: 150,
            bottom: 80,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Table(
                      defaultColumnWidth: const FlexColumnWidth(),
                      children: [
                        TableRow(children: [
                          Container(
                              height: 50,
                              decoration: tableBoxDecoration(),
                              child: Center(
                                child: Text(
                                  courseCode,
                                  style: customTextStyle(),
                                ),
                              )),
                          Container(
                              height: 50,
                              decoration: tableBoxDecoration(),
                              child: Center(
                                  child:
                                      Text(units, style: customTextStyle()))),
                          Container(
                              height: 50,
                              decoration: tableBoxDecoration(),
                              child: Center(
                                  child:
                                      Text(rating, style: customTextStyle()))),
                        ]),
                        ...gradesList.map((data) {
                          return TableRow(children: [
                            Container(
                              decoration: tableBoxDecoration(),
                              child: TextField(
                                onChanged: (value) {
                                  data.courseCode = value;
                                },
                              ),
                            ),
                            Container(
                              decoration: tableBoxDecoration(),
                              child: TextField(
                                onChanged: (value) {
                                  data.units = int.parse(value);
                                },
                              ),
                            ),
                            Container(
                              decoration: tableBoxDecoration(),
                              child: TextField(
                                onChanged: (value) {
                                  data.rating = double.parse(value);
                                },
                              ),
                            ),
                          ]);
                        }).toList(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                FloatingActionButton(
                  shape: const CircleBorder(),
                  onPressed: () {
                    setState(() {
                      gradesList.add(Grades());
                    });
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: checkResBoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: Text(check,
                      style: customTextStyle(
                          size: 20.0, fontWeight: FontWeight.w700)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
