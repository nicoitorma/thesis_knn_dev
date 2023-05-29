import '../models/grades.dart';
import '../values/strings.dart';

class CategorizeGrades {
  /// This function removes objects from a list if they have null values for certain properties.
  List removeNullValues(List gradesList) {
    gradesList.removeWhere((obj) =>
        obj.courseCode == null || obj.units == null || obj.rating == null);
    if (!gradesList.contains(null)) {
      return gradesList;
    }
    return gradesList;
  }

  List<List<double>> removeEmptyLists(List<List<double>> list) {
    return list.where((innerList) => innerList.isNotEmpty).toList();
  }

  List<List<double>> categorizeSemesters(String program, List grades) {
    List gradesList = removeNullValues(grades);
    List<List<double>> categorizedGrades = List.generate(7, (_) => []);
    final courseMappings = (program == 'BSCS')
        ? csCourseMappings
        : (program == 'BSIS')
            ? isCourseMappings
            : itCourseMappings;
    for (Grades grade in gradesList) {
      String courseCode = grade.courseCode!.toUpperCase();
      int categoryIndex =
          courseMappings.indexWhere((courses) => courses.contains(courseCode));

      if (categoryIndex != -1) {
        categorizedGrades[categoryIndex].add(grade.rating!);
      }
    }

    return removeEmptyLists(categorizedGrades);
  }
}
