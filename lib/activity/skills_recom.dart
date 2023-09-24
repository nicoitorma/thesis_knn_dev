import 'package:flutter/material.dart';
import 'package:th_knn/controllers/retrieve_career.dart';
import 'package:th_knn/drawables/bg.dart';
import 'package:th_knn/values/colors.dart';
import 'package:th_knn/widgets/header.dart';
import 'package:th_knn/widgets/text_style.dart';

import '../models/skills.dart';
import '../values/strings.dart';

class SkillsRecom extends StatelessWidget {
  const SkillsRecom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(toolbarHeight: 0),
        body: Stack(
          children: [
            const BackgroundImage(),
            Header(headerTitle: labelSkill),
            Positioned.fill(
                top: 100,
                child: FutureBuilder(
                    future: getSkills(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      List<Skill> data = snapshot.data as List<Skill>;
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final skill = data[index];
                            return ExpansionTile(
                                textColor: Colors.white,
                                collapsedTextColor: Colors.white,
                                title: Text(skill.title.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                subtitle: Text(skill.reference.toString()),
                                children: data[index]
                                    .skill
                                    .map((data) => Container(
                                          margin: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              color: skillListBackgroundColor,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(5))),
                                          child: Row(children: [
                                            const SizedBox(width: 10),
                                            Text('\u2022',
                                                style: bulletTextStyle()),
                                            const SizedBox(width: 5),
                                            Expanded(
                                              child: Text(data.toString(),
                                                  textAlign: TextAlign.left,
                                                  softWrap: true,
                                                  style: skillsTextStyle()),
                                            )
                                          ]),
                                        ))
                                    .toList());
                          });
                    }))
          ],
        ));
  }
}
