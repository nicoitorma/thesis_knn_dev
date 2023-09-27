import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:th_knn/values/strings.dart';
import 'package:th_knn/widgets/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

import '../activity/check_career.dart';
import '../activity/skills_recom.dart';
import '../values/const.dart';
import 'about.dart';
import 'help.dart';

drawer({var scaffoldKey}) => StatefulBuilder(builder: ((context, setState) {
      return Drawer(
          elevation: 5,
          backgroundColor: Colors.white,
          child: ListView(shrinkWrap: true, children: [
            DrawerHeader(
              child: Center(
                child: AspectRatio(
                  aspectRatio: 2.5,
                  child: Image.asset(
                    'assets/imgs/header.png',
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard_rounded),
              title: Text('Dashboard',
                  style: customTextStyle(size: 16.0, color: Colors.black)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.edit_document),
              title: Text(btn1,
                  style: customTextStyle(size: 16.0, color: Colors.black)),
              onTap: () async {
                String url = 'https://group-1dev.github.io/cict-cog';
                if (await canLaunchUrl(Uri.parse(url))) {
                  const CircularProgressIndicator();
                  await launchUrl(Uri.parse(url),
                      mode: LaunchMode.platformDefault);
                }
              },
            ),
            ListTile(
                leading: const Icon(Icons.auto_graph_outlined),
                title: Text(btn2,
                    style: customTextStyle(size: 16.0, color: Colors.black)),
                onTap: () {
                  if (!kIsWeb && scaffoldKey.currentState.isDrawerOpen) {
                    scaffoldKey.currentState?.closeDrawer();
                  }
                  Navigator.of(context).push(PageTransition(
                      type: PageTransitionType.rightToLeftJoined,
                      child: const CheckCareer(),
                      duration: duration,
                      reverseDuration: duration,
                      childCurrent: drawer()));
                }),
            ListTile(
              leading: const Icon(Icons.account_tree),
              title: Text(btn3,
                  style: customTextStyle(size: 16.0, color: Colors.black)),
              onTap: () {
                if (!kIsWeb && scaffoldKey.currentState.isDrawerOpen) {
                  scaffoldKey.currentState?.closeDrawer();
                }
                Navigator.of(context).push(PageTransition(
                    type: PageTransitionType.rightToLeftJoined,
                    child: const SkillsRecom(),
                    duration: duration,
                    reverseDuration: duration,
                    childCurrent: drawer()));
              },
            ),
            kIsWeb
                ? ListTile(
                    leading: const Icon(Icons.privacy_tip_rounded),
                    title: Text(labelPrivacy,
                        style:
                            customTextStyle(size: 16.0, color: Colors.black)),
                    onTap: () async {
                      String url =
                          'https://nicoitorma.github.io/ocg-knn/ocg-priv-pol.html';
                      if (await canLaunchUrl(Uri.parse(url))) {
                        const CircularProgressIndicator();
                        await launchUrl(Uri.parse(url),
                            mode: LaunchMode.platformDefault);
                      }
                    },
                  )
                : Container(),
            ListTile(
              leading: const Icon(Icons.help),
              title: Text(labelHelp,
                  style: customTextStyle(size: 16.0, color: Colors.black)),
              onTap: () async {
                if (kIsWeb) {
                  String url =
                      'https://nicoitorma.github.io/ocg-knn/ocg-help.html';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    const CircularProgressIndicator();
                    await launchUrl(Uri.parse(url),
                        mode: LaunchMode.platformDefault);
                  }
                } else {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const HelpScreen()));
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: Text(labelAbout,
                  style: customTextStyle(size: 16.0, color: Colors.black)),
              onTap: () async {
                if (kIsWeb) {
                  String url =
                      'https://nicoitorma.github.io/ocg-knn/ocg-about.html';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    const CircularProgressIndicator();
                    await launchUrl(Uri.parse(url),
                        mode: LaunchMode.platformDefault);
                  }
                } else {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const AboutScreen()));
                }
              },
            )
          ]));
    }));
