import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Colors.black),
    ),
    colorScheme: ColorScheme.light(
        brightness: Brightness.light,
        background: Colors.white,
        primary: Colors.black,
        secondary: Colors.grey[300]!));
