import '../models/grades.dart';

class CleanGrades {
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
    List<double> cleanedData = [];

    for (Grades grade in gradesList) {
      cleanedData.add(grade.rating!);
    }
    return cleanedData;
  }
}
