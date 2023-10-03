import 'grades.dart';

class Rating {
  List<Grades>? grades;
  String? program;
  String? idNum;
  double? rating;
  String? expectedCareer;

  Rating(
      {this.grades,
      this.program,
      this.idNum,
      this.rating,
      this.expectedCareer});
}
