import 'package:flutter/material.dart';
import 'package:th_knn/widgets/footer.dart';
import 'package:th_knn/widgets/knn_animation.dart';
import 'package:th_knn/widgets/text_style.dart';

import '../values/const.dart';
import '../values/strings.dart';
import 'overview.dart';

mainContent() => Padding(
    padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20, bottom: 5),
    child: Stack(children: [
      Container(
        alignment: Alignment.topLeft,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              headingCard(labelOverview, labelOverview1),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  labelTheKnn,
                                  style: customTextStyle(
                                      size: 18.0, fontWeight: FontWeight.bold),
                                ),
                              ),
                              AspectRatio(
                                aspectRatio: 2,
                                child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration:
                                        BoxDecoration(border: Border.all()),
                                    child: const KNNAnimation()),
                              ),
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(width: 20),
                  const Expanded(
                    flex: 2,
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: AspectRatio(
                            aspectRatio: 1.9, child: RandomBarGraph()),
                      ),
                    ),
                  )
                ],
              ),
            ]),
      ),
      footer()
    ]));
