import 'package:flutter/material.dart';
import 'package:th_knn/drawables/bg.dart';
import 'package:th_knn/layouts/box_decoration.dart';
import 'package:th_knn/layouts/header.dart';
import 'package:th_knn/layouts/text_style.dart';
import 'package:th_knn/models/grades.dart';
import 'package:th_knn/utils/categorize_grades.dart';
import '../values/strings.dart';
import 'knn_results.dart';

class CheckCareer extends StatefulWidget {
  const CheckCareer({super.key});

  @override
  State<CheckCareer> createState() => _CheckCareerState();
}

class _CheckCareerState extends State<CheckCareer> {
  CategorizeGrades categorizeGrades = CategorizeGrades();
  String? selectedCourse;

  List<Grades> gradesList = [Grades(), Grades()];

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
                programDropdown(),
                Flexible(
                  fit: FlexFit.tight,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: IgnorePointer(
                      ignoring: selectedCourse == null,
                      child: Table(
                        defaultColumnWidth: const FlexColumnWidth(),
                        children: [
                          TableRow(children: [
                            gradeContainer(courseCode),
                            gradeContainer(units),
                            gradeContainer(rating),
                          ]),
                          ...gradesList.map((data) {
                            return TableRow(children: [
                              buildTextFieldContainer(
                                onChanged: (value) {
                                  data.courseCode = value;
                                },
                              ),
                              buildTextFieldContainer(
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  data.units = int.tryParse(value);
                                },
                              ),
                              buildTextFieldContainer(
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  data.rating = double.tryParse(value);
                                },
                              ),
                            ]);
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
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
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
                if (gradesList.length > 1) {
                  List result = categorizeGrades.categorizeSemesters(
                      selectedCourse!, gradesList);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (builder) =>
                          KnnResult(program: selectedCourse!, grades: result),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        insufficientData,
                        style: customTextStyle(size: 20.0, color: Colors.white),
                      ),
                    ),
                  );
                }
              },
              child: buildCheckResultsContainer(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextFieldContainer({
    String value = '',
    TextInputType keyboardType = TextInputType.text,
    required ValueChanged<String> onChanged,
  }) {
    return Container(
      decoration: tableBoxDecor(),
      child: TextFormField(
        decoration: const InputDecoration(border: InputBorder.none),
        keyboardType: keyboardType,
        textAlign: TextAlign.center,
        initialValue: value,
        onChanged: onChanged,
      ),
    );
  }

  Widget buildCheckResultsContainer() {
    return Container(
      decoration: checkResBoxDecor(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Text(
          check,
          style: customTextStyle(size: 20.0, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  gradeContainer(String title) => Container(
      height: 50,
      decoration: tableBoxDecor(),
      child: Center(
        child: Text(
          title,
          style: customTextStyle(),
        ),
      ));

  programDropdown() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: tableBoxDecor(),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('$program: ', style: customTextStyle(size: 20.0)),
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
      );
}
