import 'package:flutter/material.dart';
import 'package:th_knn/values/const.dart';
import 'package:th_knn/widgets/drawer.dart';
import 'package:th_knn/widgets/overview.dart';
import 'package:th_knn/widgets/text_style.dart';

import '../values/strings.dart';
import '../widgets/appbar.dart';

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
        body: Stack(children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Drawer
              SizedBox(
                  width: MediaQuery.sizeOf(context).width / 6, child: drawer()),
              // Main Content
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              overview(),
                              const SizedBox(height: 30),
                              Row(
                                children: [
                                  Expanded(
                                    child: Card(
                                        elevation: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    labelTheKnn,
                                                    textAlign: TextAlign.start,
                                                    style: customTextStyle(
                                                        size: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                AspectRatio(
                                                  aspectRatio: 2,
                                                  child: Image.asset(
                                                      'assets/imgs/knn.gif'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                  ),
                                  const SizedBox(width: 20),
                                  const Expanded(
                                    child: Card(
                                      elevation: 5,
                                      child: Padding(
                                        padding: EdgeInsets.all(15),
                                        child: AspectRatio(
                                            aspectRatio: 1.9,
                                            child: RandomBarGraph()),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ]),
                      )))
            ],
          ),
        ]));
  }
}
