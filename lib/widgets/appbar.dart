import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:th_knn/widgets/text_style.dart';

appBar(String title) => AppBar(
    backgroundColor: Colors.white,
    centerTitle: (kIsWeb) ? true : false,
    title: Text(title, style: headerTextStyle()));
