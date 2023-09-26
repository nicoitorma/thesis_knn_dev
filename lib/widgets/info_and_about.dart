import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'about.dart';
import 'help.dart';

// The info and about button in the bottom left of the main screen

class InfoAbout extends StatelessWidget {
  const InfoAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 10,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () async {
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
                icon: const Icon(Icons.info, color: Colors.white)),
            IconButton(
                onPressed: () async {
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
                icon: const Icon(Icons.help, color: Colors.white)),
          ],
        ));
  }
}
