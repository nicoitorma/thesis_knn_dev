import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

import '../activity/check_career.dart';
import '../activity/skills_recom.dart';
import '../values/const.dart';
import '../values/strings.dart';
import 'main_container.dart';

mainContent() => StatefulBuilder(builder: ((context, setState) {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Center(
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    borderRadius: BorderRadius.circular(20.0),
                    onTap: () async {
                      String url = 'https://group-1dev.github.io/cict-cog';
                      if (await canLaunchUrl(Uri.parse(url))) {
                        const CircularProgressIndicator();
                        await launchUrl(Uri.parse(url),
                            mode: LaunchMode.platformDefault);
                      }
                    },
                    child: mainWidgetContainer(btn1)),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () => Navigator.of(context).push(PageTransition(
                      type: PageTransitionType.rightToLeftJoined,
                      child: const CheckCareer(),
                      duration: duration,
                      reverseDuration: duration,
                      childCurrent: mainContent())),
                  child: mainWidgetContainer(btn2),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () => Navigator.of(context).push(PageTransition(
                      type: PageTransitionType.rightToLeftJoined,
                      child: const SkillsRecom(),
                      duration: duration,
                      reverseDuration: duration,
                      childCurrent: mainContent())),
                  child: mainWidgetContainer(btn3),
                ),
              ]),
        ),
      );
    }));
