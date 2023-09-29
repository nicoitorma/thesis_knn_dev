import 'package:flutter/material.dart';
import 'package:th_knn/values/colors.dart';

customBoxDecor({var borderRadius}) => BoxDecoration(
    color: customBoxColorOrig,
    borderRadius: borderRadius ?? BorderRadius.circular(32.0),
    border: Border.all(width: 5.0, color: boxBorderColor));

// The decoration and width of the textbox in the Check Career Path
tableBoxDecor() => BoxDecoration(
    color: customBoxColorOrig,
    border: Border.all(width: 1.0, color: boxBorderColor));

// Decoration of the [ Result ] Button in the Check career Path
checkResBoxDecor() => BoxDecoration(
    color: customBoxColorOrig,
    borderRadius: BorderRadius.circular(32.0),
    border: Border.all(width: 5.0, color: fabColor));
