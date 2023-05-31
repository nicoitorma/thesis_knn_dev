import 'package:flutter/material.dart';
import 'package:th_knn/layouts/text_style.dart';

class Results extends StatelessWidget {
  final Color color;
  final String result;
  const Results({super.key, required this.color, required this.result});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 30,
            width: 30,
            color: color,
          ),
        ),
        const SizedBox(width: 5),
        Flexible(
          child: Text(
            result,
            textAlign: TextAlign.start,
            style: customTextStyle(),
          ),
        ),
      ],
    );
  }
}
