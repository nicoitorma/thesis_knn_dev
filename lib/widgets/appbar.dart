import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:th_knn/widgets/text_style.dart';

appBar({var context, String? title}) => AppBar(
    toolbarHeight: 70,
    centerTitle: (kIsWeb) ? true : false,
    title: FittedBox(
      fit: BoxFit.fitWidth,
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/imgs/catsu.png', height: 50, width: 50),
            const SizedBox(width: 15),
            Text(
              title!,
              style: headerTextStyle(),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(width: 15),
            Image.asset('assets/imgs/cict.png', height: 60, width: 60)
          ]),
    ));
