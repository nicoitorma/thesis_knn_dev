import 'package:flutter/material.dart';
import 'package:th_knn/widgets/text_style.dart';

import '../values/const.dart';
import '../values/strings.dart';
import 'overview.dart';

mainContent() => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      alignment: Alignment.topLeft,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        overview(),
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
                          alignment: Alignment.topLeft,
                          child: Text(
                            labelTheKnn,
                            textAlign: TextAlign.start,
                            style: customTextStyle(
                                size: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        AspectRatio(
                          aspectRatio: 2,
                          child: Image.asset('assets/imgs/knn.gif'),
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
                  child: AspectRatio(aspectRatio: 1.9, child: RandomBarGraph()),
                ),
              ),
            )
          ],
        ),
      ]),
    ));
