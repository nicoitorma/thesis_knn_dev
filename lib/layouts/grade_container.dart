import 'package:flutter/material.dart';

import 'box_decoration.dart';
import 'text_style.dart';

class GradeContainer extends StatelessWidget {
  final String? _title;
  const GradeContainer(this._title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        decoration: tableBoxDecor(),
        child: Center(
          child: Text(
            _title!,
            style: customTextStyle(),
          ),
        ));
  }
}
