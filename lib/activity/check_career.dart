import 'package:flutter/material.dart';
import 'package:th_knn/widgets/appbar.dart';
import 'package:th_knn/widgets/box_decoration.dart';
import 'package:th_knn/widgets/overview.dart';
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
        appBar: appBar(title: btn2),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              // Instructions
              headingCard(labelInstruction, labelInstruction1),
              const SizedBox(height: 10),
              // ID Number and Program
              Card(
                elevation: 5,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      /// ID number field
                      Flexible(
                        child: Padding(
                            padding: const EdgeInsets.all(10),
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
                                  hintStyle: customTextStyle(size: 18.0)),
                            )),
                      ),

                      /// Program drop-down
                      Flexible(
                        child: DropdownButton<String>(
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
              const SizedBox(height: 10),
              // Form fields
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: IgnorePointer(
                    ignoring: idNum.isEmpty && selectedCourse == null,
                    child: Opacity(
                      opacity:
                          idNum.isEmpty && selectedCourse == null ? 0.5 : 1.0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Table(
                                border: TableBorder.all(width: 2),
                                defaultColumnWidth: const FlexColumnWidth(),
                                children: [
                                  TableRow(
                                    children: [
                                      gradeContainer(courseCode),
                                      gradeContainer(units),
                                      gradeContainer(rating),
                                    ],
                                  ),
                                  for (var data in gradesList)
                                    TableRow(
                                      children: [
                                        buildTextFieldContainer(
                                          onChanged: (value) => data
                                              .courseCode = value.toUpperCase(),
                                        ),
                                        buildTextFieldContainer(
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) =>
                                              data.units = int.tryParse(value),
                                        ),
                                        buildTextFieldContainer(
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) => data.rating =
                                              double.tryParse(value),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // FAB and Check result
              Align(
                alignment: Alignment.bottomCenter,
                child: Card(
                  elevation: 5,
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton(
                          tooltip: labelFabTooltip,
                          onPressed: () {
                            if ((selectedCourse == null) || (idNum == '')) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  errorNoIdProgram,
                                  style: customTextStyle(size: 14.0),
                                ),
                              ));
                              return;
                            }
                            setState(() => gradesList.add(Grades()));
                          },
                          child: const Icon(Icons.add),
                        ),
                        InkWell(
                          onTap: () {
                            if ((gradesList.length > 10) &&
                                (selectedCourse != null) &&
                                (idNum != '')) {
                              List result =
                                  categorizeGrades.categorizeSemesters(
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
                                    style: customTextStyle(
                                        size: 14.0, color: Colors.white),
                                  ),
                                ),
                              );
                            }
                          },
                          child: checkResultsButtton(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ));
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
          style: customTextStyle(size: 14.0, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
