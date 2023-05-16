import 'package:flutter/material.dart';
import 'package:th_knn/activity/knn_results.dart';
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
  List<Grades> gradesList = [Grades(), Grades(), Grades()];

  /// This function removes objects from a list if they have null values for certain properties.
  void removeNullValues() {
    gradesList.removeWhere((obj) =>
        obj.courseCode == null || obj.units == null || obj.rating == null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0.0),
      body: Stack(
        children: [
          const BackgroundImage(),
          const Header(headerTitle: 'Enter your grades'),
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
                              decoration: tableBoxDecor(),
                              child: Center(
                                child: Text(
                                  courseCode,
                                  style: customTextStyle(),
                                ),
                              )),
                          Container(
                              height: 50,
                              decoration: tableBoxDecor(),
                              child: Center(
                                  child:
                                      Text(units, style: customTextStyle()))),
                          Container(
                              height: 50,
                              decoration: tableBoxDecor(),
                              child: Center(
                                  child:
                                      Text(rating, style: customTextStyle()))),
                        ]),
                        ...gradesList.map((data) {
                          return TableRow(children: [
                            /// This code is creating a `Container` widget that contains a `TextField`
                            /// widget. The `TextField` widget is used to allow the user to input a
                            /// value for the `rating` property of a `Grades` object. The `onChanged`
                            /// callback function is triggered whenever the user types a new value into
                            /// the `TextField`. This function updates the `rating` property of the
                            /// corresponding `Grades` object in the `gradesList` list with the new
                            /// value entered by the user. The `tableBoxDecoration()` function is used
                            /// to apply a custom decoration to the `Container` widget, which likely
                            /// includes a border and background color to make the table look more
                            /// visually appealing.
                            Container(
                              decoration: tableBoxDecor(),
                              child: TextField(
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  data.courseCode = value;
                                },
                              ),
                            ),
                            Container(
                              decoration: tableBoxDecor(),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  data.units = int.parse(value);
                                },
                              ),
                            ),
                            Container(
                              decoration: tableBoxDecor(),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
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

                /// This code is creating a floating action button with a circular shape and an "add"
                /// icon. When the button is pressed, it adds a new instance of the `Grades` class to
                /// the `gradesList` list and triggers a state update using the `setState()` method.
                /// This will cause the UI to rebuild and display the new row in the table.
                FloatingActionButton(
                  shape: const CircleBorder(),
                  backgroundColor: Colors.grey,
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

          /// This is a `GestureDetector` widget that is used to detect a tap gesture on the container
          /// that displays the "Check my results" text. When the container is tapped, the `removeNullValues()`
          /// function is called to remove any objects from the `gradesList` list that have null values
          /// for certain properties. This is likely used to ensure that the user has entered valid data
          /// before proceeding with the "Check my result" action.
          GestureDetector(
            onTap: () {
              removeNullValues();
              // final data = [
              //   [1.0, 2.0, 3.0],
              //   [4.0, 5.0, 6.0],
              //   [7.0, 8.0, 9.0],
              // ];
              // final scaler = StandardScaler();
              // scaler.fit(data);
              // final transformedData = scaler.transform(data);

              // print(transformedData);
              print(gradesList);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (builder) => KnnResult(grades: gradesList)));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: checkResBoxDecor(),
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
          ),
        ],
      ),
    );
  }
}
