import 'package:flutter/material.dart';

customTextStyle({var size, var fontWeight, var color}) => TextStyle(
    fontFamily: 'Poppins',
    fontSize: size ?? 16.0,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? Colors.black);

headerTextStyle() => const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 26,
    color: Colors.white,
    fontWeight: FontWeight.w600);

skillsTextStyle() => const TextStyle(
      fontSize: 16,
      color: Colors.white,
      height: 1.55,
    );

bulletTextStyle() =>
    const TextStyle(fontSize: 16, height: 1.55, color: Colors.white);
