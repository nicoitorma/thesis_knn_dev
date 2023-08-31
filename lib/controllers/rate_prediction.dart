import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/grades.dart';
import '../values/strings.dart';

final _db = FirebaseFirestore.instance;

saveGradeToOnline(List<Grades> grades, String program, String? idNum,
    String expectedCareer) async {
  Map<String, dynamic> dataMap = {};

  for (int i = 0; i < grades.length; i++) {
    int? unit = grades[i].units;
    double? rating = grades[i].rating;

    Map<String, dynamic> unitRatingMap = {
      'rating': rating,
      'units': unit,
    };
    dataMap[grades[i].courseCode!] = unitRatingMap;
  }

  try {
    /// This will add a new grades to the document [saved_grades]
    await _db
        .collection(labelCollection)
        .doc('$program ($idNum) - $expectedCareer')
        .set(dataMap);
  } catch (err) {
    print(err);
  }
}
