import 'package:flutter/material.dart';
import 'package:th_knn/widgets/text_style.dart';

class Results extends StatelessWidget {
  final Color color;
  final String result;
  const Results({super.key, required this.color, required this.result});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 30,
            width: 30,
            color: color,
          ),
        ),
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
