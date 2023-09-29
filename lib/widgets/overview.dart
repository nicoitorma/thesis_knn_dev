import 'package:flutter/material.dart';
import 'package:th_knn/widgets/text_style.dart';

headingCard(String text1, String text2) => Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                text1,
                textAlign: TextAlign.start,
                style: customTextStyle(size: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
            Align(
                alignment: Alignment.topLeft,
                child: Text(text2, style: customTextStyle(size: 16.0))),
          ],
        ),
      ),
    );
