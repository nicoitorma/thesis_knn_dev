import 'package:flutter/material.dart';

// final backgroundImage = Container(
//   decoration: const BoxDecoration(
//     image: DecorationImage(
//       image: AssetImage('assets/imgs/bg.png'),
//       opacity: 0.6,
//       fit: BoxFit.cover,
//     ),
//   ),
// );

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: 0.6,
        child: Image.asset('assets/imgs/bg.png',
            fit: BoxFit.cover,
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width));
  }
}
