import 'package:flutter/material.dart';
import 'package:th_knn/backgrounds/bg.dart';
import 'package:th_knn/widgets/box_decoration.dart';
import 'package:th_knn/widgets/header.dart';
import 'package:th_knn/widgets/text_style.dart';
import 'package:th_knn/models/grades.dart';
import 'package:th_knn/controllers/categorize_grades.dart';
import '../widgets/grade_containers.dart';
import '../values/strings.dart';
import 'knn_results.dart';

// Code for the Check Career Path button in the main screen
class CheckCareer extends StatefulWidget {
  const CheckCareer({super.key});

  @override
  State<CheckCareer> createState() => _CheckCareerState();
}

class _CheckCareerState extends State<CheckCareer> {
  CleanGrades categorizeGrades = CleanGrades();
  String? selectedCourse;
  String idNum = '';
  final idNumController = TextEditingController();

  List<Grades> gradesList = [Grades(), Grades()];

  @override
  void dispose() {
    idNumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0.0),
      body: Stack(
        children: [
          const BackgroundImage(),
          Header(headerTitle: labelEnterGrades),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Container(
              decoration: tableBoxDecor(),
              margin: const EdgeInsets.only(top: 100),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: TextField(
                            controller: idNumController,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                idNum = value.toString();
                              }
                            },
                            style: customTextStyle(size: 20.0),
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                hintText: labelIdNum,
                                hintStyle: const TextStyle(
                                    fontFamily: 'Poppins', fontSize: 18)),
                          )),
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
                  ]),
            ),
          ),
          Positioned.fill(
            top: 190,
            bottom: 80,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: SingleChildScrollView(
                child: IgnorePointer(
                  ignoring: (idNum == '') && (selectedCourse == null),
                  child: Opacity(
                    opacity:
                        (idNum == '') && (selectedCourse == null) ? 0.5 : 1.0,
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
                                  gradeContainer(courseCode),
                                  gradeContainer(units),
                                  gradeContainer(rating),
                                ]),
                                ...gradesList.map((data) {
                                  return TableRow(children: [
                                    buildTextFieldContainer(
                                      onChanged: (value) {
                                        data.courseCode = value.toUpperCase();
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
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: InkWell(
                onTap: () {
                  if ((gradesList.length > 10) &&
                      (selectedCourse != null) &&
                      (idNum != '')) {
                    List result = categorizeGrades.categorizeSemesters(
                        selectedCourse!, gradesList);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (builder) => KnnResult(
                          gradesList: gradesList,
                          program: selectedCourse!,
                          grades: result,
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
                child: checkResultsButtton(),
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

  Widget checkResultsButtton() {
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
}
