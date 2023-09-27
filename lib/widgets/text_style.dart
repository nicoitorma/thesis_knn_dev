import 'package:flutter/material.dart';

customTextStyle({var size, var fontWeight, var color}) => TextStyle(
    fontFamily: 'Poppins',
    fontSize: size ?? 16.0,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? Colors.black);

headerTextStyle() => const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 26,
    color: Colors.black,
    fontWeight: FontWeight.w600);

skillsTextStyle() => const TextStyle(
      fontSize: 16,
      color: Colors.black,
    );
