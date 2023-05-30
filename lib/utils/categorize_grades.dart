import '../models/grades.dart';
import '../values/strings.dart';

class CategorizeGrades {
  /// This function removes objects from a list if they have null values for certain properties.
  List<Grades> removeNullValues(List<Grades> gradesList) {
    gradesList.removeWhere((obj) =>
        obj.courseCode == null || obj.units == null || obj.rating == null);
    return gradesList;
  }

  List<List<double>> removeEmptyLists(List<List<double>> list) {
    return list.where((innerList) => innerList.isNotEmpty).toList();
  }

  List<List> categorizeSemesters(String program, List<Grades> grades) {
    List<Grades> gradesList = removeNullValues(grades);
    List<double> gradesInitial = [
      2.9,
      1.6,
      1.5,
      1.4,
      1.5,
      1.1,
      1.2,
      1.6,
      1,
      1.8,
      1.8,
      2.4,
      1.2,
      1.3,
      1,
      1.2,
      1.5,
      1.7,
      1.7,
      1.2,
      1.7
    ];
    List<List<double>> sortedGrades;

    final courseMappings = (program == 'BSCS')
        ? csCourseMappings
        : (program == 'BSIS')
            ? isCourseMappings
            : itCourseMappings;

    for (Grades grade in gradesList) {
      String courseCode = grade.courseCode!.toUpperCase();
      int categoryIndex = courseMappings.indexOf(courseCode);

      if (categoryIndex != -1) {
        //gradesInitial.insert(categoryIndex, grade.rating!);
      }
    }
    gradesInitial.removeWhere((element) => element == 0);
    sortedGrades = [gradesInitial];
    sortedGrades = removeEmptyLists(sortedGrades);
    return sortedGrades;
  }
}
