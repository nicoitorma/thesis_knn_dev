import 'package:flutter/material.dart';
import 'package:th_knn/drawables/bg.dart';
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
      body: Stack(
        children: [
          backgroundImage,
          const Header(),
          Positioned.fill(
            top: 120,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Table(
                    border: TableBorder.all(),
                    defaultColumnWidth: const FlexColumnWidth(),
                    children: [
                      TableRow(children: [
                        TableCell(
                            child: Text(courseCode, style: customTextStyle())),
                        TableCell(
                            child: Text(
                          units,
                          style: customTextStyle(),
                        )),
                        TableCell(
                            child: Text(
                          rating,
                          style: customTextStyle(),
                        ))
                      ]),
                      ...gradesList.map((data) {
                        return TableRow(children: [
                          TableCell(
                            child: TextField(
                              onChanged: (value) {
                                data.courseCode = value;
                              },
                            ),
                          ),
                          TableCell(
                            child: TextField(
                              onChanged: (value) {
                                data.units = int.parse(value);
                              },
                            ),
                          ),
                          TableCell(
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
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(check,
                  style:
                      customTextStyle(size: 20, fontWeight: FontWeight.w700)),
            ),
          ),
        ],
      ),
    );
  }
}
