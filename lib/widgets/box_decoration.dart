import 'package:flutter/material.dart';
import 'package:th_knn/values/colors.dart';

customBoxDecor({var borderRadius}) => BoxDecoration(
    color: customBoxColorOrig,
    borderRadius: borderRadius ?? BorderRadius.circular(32.0),
    border: Border.all(width: 5.0, color: boxBorderColor));

tableBoxDecor() => BoxDecoration(
    color: customBoxColorOrig,
    border: Border.all(width: 2.0, color: boxBorderColor));

checkResBoxDecor() => BoxDecoration(
    color: customBoxColorOrig,
    borderRadius: BorderRadius.circular(32.0),
    border: Border.all(width: 5.0, color: const Color(0xb2333572)));
