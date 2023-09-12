import 'package:flutter/material.dart';
import 'package:th_knn/controllers/retrieve_career.dart';
import 'package:th_knn/drawables/bg.dart';
import 'package:th_knn/widgets/header.dart';

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
                          return ExpansionTile(
                              title: Text(data[index].title.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              subtitle: Text(data[index].reference.toString()),
                              children: data[index]
                                  .skill
                                  .map((data) => Row(children: [
                                        const SizedBox(width: 10),
                                        const Text(
                                          '\u2022',
                                          style: TextStyle(
                                            fontSize: 16,
                                            height: 1.55,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Expanded(
                                          child: Text(
                                            data.toString(),
                                            textAlign: TextAlign.left,
                                            softWrap: true,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              height: 1.55,
                                            ),
                                          ),
                                        )
                                      ]))
                                  .toList());
                        });
                  }),
            )
          ],
        ));
  }
}
