import 'package:flutter/material.dart';
import 'package:th_knn/widgets/text_style.dart';

import '../values/strings.dart';

overview() => Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                labelOverview,
                textAlign: TextAlign.start,
                style: customTextStyle(size: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
            Text(labelOverview1, style: customTextStyle(size: 16.0)),
          ],
        ),
      ),
    );
