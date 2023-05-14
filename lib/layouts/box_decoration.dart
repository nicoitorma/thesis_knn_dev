import 'package:flutter/material.dart';

customBoxDecoration({var borderRadius}) => BoxDecoration(
    color: const Color(0xb2ffffff),
    borderRadius: borderRadius ?? BorderRadius.circular(32.0),
    border: Border.all(width: 5.0, color: const Color(0xb2707070)));

tableBoxDecoration() => BoxDecoration(
    color: const Color(0xb2ffffff),
    border: Border.all(width: 2.0, color: const Color(0xb2707070)));

checkResBoxDecoration() => BoxDecoration(
    color: const Color(0xb2ffffff),
    borderRadius: BorderRadius.circular(32.0),
    border: Border.all(width: 5.0, color: const Color(0xb2333572)));
