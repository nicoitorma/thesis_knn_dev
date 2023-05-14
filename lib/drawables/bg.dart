import 'package:flutter/material.dart';

final backgroundImage = Container(
  decoration: const BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/imgs/bg.png'),
      opacity: 60.0,
      fit: BoxFit.cover,
    ),
  ),
);
