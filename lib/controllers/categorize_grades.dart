import '../models/grades.dart';

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

  List categorizeSemesters(String program, List<Grades> grades) {
    List<Grades> gradesList = removeNullValues(grades);
    List<double> sortedGrades = [];

    // final courseMappings = (program == 'BSCS')
    //     ? csCourseMappings
    //     : (program == 'BSIS')
    //         ? isCourseMappings
    //         : itCourseMappings;

    for (Grades grade in gradesList) {
      // String courseCode = grade.courseCode!.toUpperCase();
      // int categoryIndex = courseMappings.indexOf(courseCode);

      // if (categoryIndex != -1) {
      //   gradesInitial.insert(categoryIndex, grade.rating!);
      // }

      sortedGrades.add(grade.rating!);
    }
    // sortedGrades.removeWhere((element) => element == 0);
    // sortedGrades = [gradesInitial];
    // sortedGrades = removeEmptyLists(sortedGrades);
    return sortedGrades;
  }
}
