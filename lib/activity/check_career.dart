import 'package:flutter/material.dart';
import 'package:th_knn/drawables/bg.dart';
import 'package:th_knn/layouts/box_decoration.dart';
import 'package:th_knn/layouts/grade_container.dart';
import 'package:th_knn/layouts/header.dart';
import 'package:th_knn/layouts/text_style.dart';
import 'package:th_knn/models/grades.dart';
import 'package:th_knn/utils/categorize_grades.dart';
import '../values/strings.dart';

class CheckCareer extends StatefulWidget {
  const CheckCareer({super.key});

  @override
  State<CheckCareer> createState() => _CheckCareerState();
}

class _CheckCareerState extends State<CheckCareer> {
  CategorizeGrades categorizeGrades = CategorizeGrades();
  String? selectedCourse;

  List<Grades> gradesList = [Grades(), Grades(), Grades()];

  final List<String> courseItem = [
    'BSCS',
    'BSIT',
    'BSIS',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0.0),
      body: Stack(
        children: [
          const BackgroundImage(),
          const Header(headerTitle: 'Enter your grades'),
          Positioned.fill(
            top: 130,
            bottom: 80,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// The code below is creating a dropdown menu with a label and a list of options. The
                /// label is the value of the variable 'program' and the options are the values in the
                /// list 'courseItem'. When an option is selected, the value of the variable
                /// 'selectedCourse' is updated with the selected option and the UI is rebuilt with the
                /// new value. The code also applies some padding and decoration to the container that
                /// holds the dropdown menu.
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: tableBoxDecor(),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text('$program: ',
                              style: customTextStyle(size: 20.0)),
                          DropdownButton<String>(
                            style: customTextStyle(size: 20.0),
                            hint: Text(program),
                            value: selectedCourse,
                            onChanged: (value) {
                              setState(() {
                                selectedCourse = value!;
                              });
                            },
                            items: courseItem.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ]),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    onTap: () {
                      if (selectedCourse == null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(noProgram,
                                style: customTextStyle(
                                    size: 20.0, color: Colors.red))));
                      }
                    },
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: IgnorePointer(
                        ignoring: selectedCourse == null,
                        child: Table(
                          defaultColumnWidth: const FlexColumnWidth(),
                          children: [
                            TableRow(children: [
                              GradeContainer(courseCode),
                              GradeContainer(units),
                              GradeContainer(rating)
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
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                    textAlign: TextAlign.center,
                                    onChanged: (value) {
                                      data.courseCode = value;
                                    },
                                  ),
                                ),
                                Container(
                                  decoration: tableBoxDecor(),
                                  child: TextField(
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    onChanged: (value) {
                                      data.units = int.tryParse(value);
                                    },
                                  ),
                                ),
                                Container(
                                  decoration: tableBoxDecor(),
                                  child: TextField(
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    onChanged: (value) {
                                      data.rating = double.tryParse(value);
                                    },
                                  ),
                                ),
                              ]);
                            }).toList(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

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

          /// This is a `Inkwell` widget that is used to detect a tap gesture on the container
          /// that displays the "Check my results" text. When the container is tapped, the `removeNullValues()`
          /// function is called to remove any objects from the `gradesList` list that have null values
          /// for certain properties. This is likely used to ensure that the user has entered valid data
          /// before proceeding with the "Check my result" action.
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  List cleanedData =
                      categorizeGrades.removeNullValues(gradesList);
                  categorizeGrades.categorizeSemesters(
                      csProgramOrder, cleanedData);

                  if (gradesList.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                      noData,
                      style: customTextStyle(size: 20.0, color: Colors.white),
                    )));
                  } else {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (builder) => KnnResult(grades: gradesList)));
                  }
                },
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
