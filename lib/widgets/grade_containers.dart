import 'package:flutter/material.dart';
import 'package:th_knn/widgets/text_style.dart';

import 'box_decoration.dart';

// Custom design implementation of textbox for
// the [ course code, units, ratings ] in the Check Career Path
gradeContainer(String title) => Container(
    height: 50,
    decoration: tableBoxDecor(),
    child: Center(
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: customTextStyle(fontWeight: FontWeight.bold),
      ),
    ));
