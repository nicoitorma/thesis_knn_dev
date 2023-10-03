import 'package:flutter/material.dart';
import 'package:th_knn/controllers/retrieve_career.dart';
import 'package:th_knn/widgets/appbar.dart';
import 'package:th_knn/widgets/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/skills.dart';
import '../values/strings.dart';

class SkillsRecom extends StatelessWidget {
  const SkillsRecom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title: btn3),
        body: Stack(
          children: [
            FutureBuilder(
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
                        return Card(
                          child: ExpansionTile(
                              title: Text(skill.title.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              subtitle: TextButton(
                                  onPressed: () async {
                                    if (await canLaunchUrl(Uri.parse(
                                        skill.reference.toString()))) {
                                      const CircularProgressIndicator();
                                      await launchUrl(
                                          Uri.parse(skill.reference.toString()),
                                          mode: LaunchMode.platformDefault);
                                    }
                                  },
                                  child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(skill.reference.toString()))),
                              children: data[index]
                                  .skill
                                  .map((data) => Card(
                                        elevation: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 3.0),
                                          child: Row(children: [
                                            const SizedBox(width: 10),
                                            const Icon(Icons.adjust_rounded,
                                                size: 15),
                                            const SizedBox(width: 5),
                                            Expanded(
                                              child: Text(data.toString(),
                                                  textAlign: TextAlign.left,
                                                  softWrap: true,
                                                  style: skillsTextStyle()),
                                            )
                                          ]),
                                        ),
                                      ))
                                  .toList()),
                        );
                      });
                })
          ],
        ));
  }
}
