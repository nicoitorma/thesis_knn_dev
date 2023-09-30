import 'package:flutter/material.dart';
import 'package:th_knn/values/strings.dart';
import 'package:th_knn/widgets/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

footer() => Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.copyright, size: 20),
              Text(labelAllrightsReserved, style: customTextStyle(size: 14.0)),
            ],
          ),
          Row(mainAxisSize: MainAxisSize.min, children: [
            TextButton(
                onPressed: () async {
                  String url = 'https://www.facebook.com/nico.itorma1/';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    const CircularProgressIndicator();
                    await launchUrl(Uri.parse(url),
                        mode: LaunchMode.platformDefault);
                  }
                },
                child: const Text('NMI')),
            const Text('|'),
            TextButton(
                onPressed: () async {
                  String url = 'https://www.facebook.com/jammy.tiocson.1';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    const CircularProgressIndicator();
                    await launchUrl(Uri.parse(url),
                        mode: LaunchMode.platformDefault);
                  }
                },
                child: const Text('JMT')),
            const Text('|'),
            TextButton(
                onPressed: () async {
                  String url = 'https://www.facebook.com/MrBatman03';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    const CircularProgressIndicator();
                    await launchUrl(Uri.parse(url),
                        mode: LaunchMode.platformDefault);
                  }
                },
                child: const Text('MJTV'))
          ]),
        ],
      ),
    );
