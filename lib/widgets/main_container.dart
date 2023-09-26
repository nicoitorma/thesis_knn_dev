import 'package:flutter/material.dart';
import 'package:th_knn/widgets/text_style.dart';

import 'box_decoration.dart';

// This is the container design for
// the buttons in main [Request COG, Check Career, Skills]

mainWidgetContainer(String text) => Container(
      width: 229.0,
      height: 112.0,
      decoration: customBoxDecor(),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          text,
          style: customTextStyle(size: 20.0),
          textAlign: TextAlign.center,
          softWrap: false,
        ),
      ),
    );
