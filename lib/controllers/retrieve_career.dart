import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:th_knn/models/skills.dart';

getSkills() async {
  try {
    final docs = await FirebaseFirestore.instance.collection('skills').get();

    final List<Skill> skills = docs.docs.map((doc) {
      final Map<String, dynamic> data = doc.data();
      final String title = doc.id;
      final String reference = data['ref'];
      final List<String> skillList = List<String>.from(data['data']);
      return Skill(title: title, reference: reference, skill: skillList);
    }).toList();

    return skills;
  } catch (err) {
    debugPrint('REPO: ${err.toString()}');
  }
}
