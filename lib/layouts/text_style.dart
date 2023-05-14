import 'package:flutter/material.dart';

customTextStyle({var size, var fontWeight}) => TextStyle(
    fontFamily: 'Poppins',
    fontSize: size ?? 16.0,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: Colors.black);
