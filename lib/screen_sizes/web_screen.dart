import 'package:flutter/material.dart';
import 'package:th_knn/widgets/widgets_in_main.dart';

import '../values/strings.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';

class WebScreen extends StatefulWidget {
  const WebScreen({super.key});

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(goodDay),
        body: LayoutBuilder(
          builder: ((context, constraints) {
            if (constraints.maxWidth > 600) {
              return Row(children: [drawer(), Expanded(child: mainContent())]);
            }
            return mainContent();
          }),
        ));
  }
}
