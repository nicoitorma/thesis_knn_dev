import 'package:flutter/material.dart';
import 'package:th_knn/values/colors.dart';
import 'package:th_knn/values/strings.dart';

class Header extends StatelessWidget {
  final String? headerTitle;
  const Header({super.key, this.headerTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(69.0),
          ),
          border: Border.all(width: 10.0, color: headerColor),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            headerTitle ?? goodDay,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 30,
              color: Color(0xff000000),
              fontWeight: FontWeight.w600,
            ),
          ),
        ));
  }
}
