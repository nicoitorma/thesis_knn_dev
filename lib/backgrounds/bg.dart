import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
      Color.fromARGB(255, 0, 168, 204),
      Color.fromARGB(255, 39, 73, 109),
    ], begin: Alignment.centerRight, end: Alignment.centerLeft)));

    // return Center(child: Image.asset('assets/imgs/knn.gif'));
    // return Container(color: Colors.white);
    //   return Opacity(
    //       opacity: 0.2,
    //       child: Image.asset('assets/imgs/bg.png',
    //           fit: BoxFit.cover,
    //           height: MediaQuery.sizeOf(context).height,
    //           width: MediaQuery.sizeOf(context).width));
    // }
  }
}
