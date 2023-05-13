import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: const Color(0x80ffffff),
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(69.0),
          ),
          border: Border.all(width: 10.0, color: const Color(0x80707070)),
        ),
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Good Day, User!',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 30,
              color: Color(0xff000000),
              fontWeight: FontWeight.w600,
            ),
          ),
        ));
  }
}
