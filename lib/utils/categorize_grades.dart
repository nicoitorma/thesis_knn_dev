import '../models/grades.dart';

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

  List<List> categorizeSemesters(List programOrder, List gradesLists) {
    List<List<double>> categorizedGrades = [];
    List<double> fyearFsem = [];

    List gradesList = [
      Grades(courseCode: 'CC101', units: 3, rating: 1.3),
      Grades(courseCode: 'CC102', units: 3, rating: 1.2),
      Grades(courseCode: 'CS112', units: 3, rating: 1.0),
      Grades(courseCode: 'CC105', units: 3, rating: 1.5)
    ];

    for (Grades grade in gradesList) {
      switch (grade.courseCode!.toUpperCase()) {
        case 'CC101':
          categorizedGrades.insert(1, fyearFsem);
          break;
        case 'CC102':
          fyearFsem.add(grade.rating!);
          break;
        case 'CC105':
      }
    }

    print(fyearFsem);
    return categorizedGrades;
  }
}
