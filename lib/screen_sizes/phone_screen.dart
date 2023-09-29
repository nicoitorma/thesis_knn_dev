import 'package:flutter/material.dart';
import 'package:th_knn/values/strings.dart';
import 'package:th_knn/widgets/drawer.dart';
import 'package:th_knn/widgets/overview.dart';
import 'package:th_knn/widgets/text_style.dart';

import '../widgets/appbar.dart';

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
      appBar: appBar(goodDay),
      drawer: drawer(scaffoldKey: scaffoldKey),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              overview(),
              const SizedBox(height: 20),
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
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
                      Image.asset('assets/imgs/knn.gif'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ]),
    );
  }
}
