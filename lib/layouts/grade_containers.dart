import 'package:flutter/material.dart';
import 'package:th_knn/layouts/text_style.dart';

import 'box_decoration.dart';

gradeContainer(String title) => Container(
    height: 50,
    decoration: tableBoxDecor(),
    child: Center(
      child: Text(
        title,
        style: customTextStyle(),
      ),
    ));
