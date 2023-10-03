import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white),
    ),
    colorScheme: ColorScheme.dark(
        brightness: Brightness.dark,
        background: Colors.grey[900]!,
        primary: Colors.grey[400]!,
        secondary: Colors.grey[700]!));
