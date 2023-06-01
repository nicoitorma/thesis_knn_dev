import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color.fromARGB(50, 58, 183, 241), Colors.blue],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)));

    // return Opacity(
    //     opacity: 0.3,
    //     child: Image.asset('assets/imgs/bg.png',
    //         fit: BoxFit.cover,
    //         height: MediaQuery.sizeOf(context).height,
    //         width: MediaQuery.sizeOf(context).width));
  }
}
