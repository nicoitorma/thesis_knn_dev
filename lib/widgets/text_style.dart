import 'package:flutter/material.dart';

customTextStyle({var size, var fontWeight, var color}) => TextStyle(
      fontSize: size ?? 16.0,
      fontWeight: fontWeight ?? FontWeight.normal,
    );

headerTextStyle() => const TextStyle(
    fontFamily: 'Poppins', fontSize: 26, fontWeight: FontWeight.w600);

skillsTextStyle() => const TextStyle(
      fontSize: 16,
    );
