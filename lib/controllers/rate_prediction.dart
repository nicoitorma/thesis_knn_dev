import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/rating.dart';
import '../values/strings.dart';

final _db = FirebaseFirestore.instance;

saveGradeToOnline(Rating predRating) async {
  Map<String, dynamic> dataMap = {};

  for (int i = 0; i < predRating.grades!.length; i++) {
    int? unit = predRating.grades![i].units;
    double? rating = predRating.grades![i].rating;

    Map<String, dynamic> unitRatingMap = {
      'rating': rating,
      'units': unit,
    };
    dataMap[predRating.grades![i].courseCode!] = unitRatingMap;
  }

  try {
    /// This will add a new grades to the document [saved_grades]
    String docName =
        '${predRating.program}_(${predRating.idNum})_(${predRating.rating}stars)_${predRating.expectedCareer}';
    await _db.collection(labelCollection).doc(docName).set(dataMap);
  } catch (err) {
    debugPrint(err.toString());
  }
}
