import 'package:flutter/material.dart';
import 'package:th_knn/values/strings.dart';
import 'package:th_knn/widgets/drawer.dart';
import 'package:th_knn/widgets/knn_animation.dart';
import 'package:th_knn/widgets/overview.dart';
import 'package:th_knn/widgets/text_style.dart';

import '../values/const.dart';
import '../widgets/appbar.dart';
import '../widgets/footer.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: appBar(title: goodDay),
      drawer: drawer(scaffoldKey: scaffoldKey),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            headingCard(labelOverview, labelOverview1),
            const SizedBox(height: 20),
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        labelTheKnn,
                        textAlign: TextAlign.start,
                        style: customTextStyle(
                            size: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(border: Border.all()),
                        padding: const EdgeInsets.all(5),
                        child: const KNNAnimation())
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: AspectRatio(aspectRatio: 1.9, child: RandomBarGraph()),
              ),
            ),
            const SizedBox(height: 25),
            footer()
          ],
        ),
      ),
    );
  }
}
