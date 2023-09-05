import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:th_knn/models/skills.dart';

import '../values/strings.dart';

getSkills() async {
  List<Skill> skills = [];
  try {
    final jsonDoc = await FirebaseFirestore.instance
        .collection(labelCollection)
        .doc(labelDoc)
        .get();

    final data = jsonDoc.data();

    data!.forEach((key, value) {
      Skill skill = Skill.fromDocumentSnapshot(key, value);
      skills.add(skill);
    });
    return skills;
  } catch (err) {
    debugPrint('REPO: ${err.toString()}');
  }
}
