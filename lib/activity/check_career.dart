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
  String idNum = '';
  final idNumController = TextEditingController();

  @override
  void dispose() {
    idNumController.dispose();
    super.dispose();
  }

  List<Grades> gradesList = [Grades(), Grades()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0.0),
      body: Stack(
        children: [
          const BackgroundImage(),
          const Header(headerTitle: 'Enter your grades'),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: tableBoxDecor(),
              margin: const EdgeInsets.only(top: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: TextField(
                      controller: idNumController,
                      onSubmitted: (value) {
                        if (value.isNotEmpty) {
                          idNum = value;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: labelIdNum,
                          hintStyle: const TextStyle(
                              fontFamily: 'Poppins', fontSize: 18.0)),
                    ),
                  ),
                  Flexible(
                    child: DropdownButton<String>(
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
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            top: 180,
            bottom: 80,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: IgnorePointer(
                        ignoring: (idNum == '') && (selectedCourse == null),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Opacity(
                            opacity: (idNum == '') && (selectedCourse == null)
                                ? 0.5
                                : 1.0,
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
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: InkWell(
                onTap: () {
                  if ((gradesList.length) > 1 &&
                      (selectedCourse != null) &&
                      (idNum != '')) {
                    List result = categorizeGrades.categorizeSemesters(
                        selectedCourse!, gradesList);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (builder) => KnnResult(
                          program: selectedCourse!,
                          grades: result,
                          gradesList: gradesList,
                          idNum: idNum,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          insufficientData,
                          style:
                              customTextStyle(size: 20.0, color: Colors.white),
                        ),
                      ),
                    );
                  }
                },
                child: checkResultsContainer(),
              ),
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

  Widget checkResultsContainer() {
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
}
