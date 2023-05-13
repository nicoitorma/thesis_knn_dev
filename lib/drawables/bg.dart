import 'package:flutter/material.dart';

final backgroundImage = Container(
  decoration: const BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/imgs/bg.png'),
      fit: BoxFit.cover,
    ),
  ),
);
