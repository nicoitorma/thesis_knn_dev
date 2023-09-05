import 'package:flutter/material.dart';

customTextStyle({var size, var fontWeight, var color}) => TextStyle(
    fontFamily: 'Poppins',
    fontSize: size ?? 16.0,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? Colors.black);
