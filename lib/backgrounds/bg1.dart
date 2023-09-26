import 'package:flutter/material.dart';

class CustomBackgroundLine1 extends CustomPainter {
  final num leftMargin;
  CustomBackgroundLine1(this.leftMargin);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue // Set the color of the line
      ..strokeCap = StrokeCap.round // Round line caps
      ..strokeWidth = 4.0; // Set the line width

    final startPoint = Offset(leftMargin.toDouble(), size.height);
    final endPoint = Offset(leftMargin.toDouble(), size.height / 2 + 55);

    canvas.drawLine(startPoint, endPoint, paint); // Draw the line
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false; // Return true if you want to repaint when properties change
  }
}

class CustomBackgroundLine2 extends CustomPainter {
  final num leftMargin;
  CustomBackgroundLine2(this.leftMargin);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue // Set the color of the line
      ..strokeCap = StrokeCap.round // Round line caps
      ..strokeWidth = 4.0; // Set the line width

    final startPoint = Offset(leftMargin.toDouble(), size.height / 2);
    final endPoint = Offset(leftMargin.toDouble(), size.height / 2 - 110);

    canvas.drawLine(startPoint, endPoint, paint); // Draw the line
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false; // Return true if you want to repaint when properties change
  }
}

class Bg1 extends StatelessWidget {
  final num? leftMargin;
  const Bg1({super.key, this.leftMargin});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: const Size(double.infinity, double.infinity),
          painter: CustomBackgroundLine1(leftMargin!),
        ),
        Positioned(
          left: leftMargin! - 50,
          top: MediaQuery.of(context).size.height / 2 -
              20.0, // Centered vertically
          child: Image.asset(
            'assets/imgs/logo.png', // Replace with your image asset path
            width: 100.0, // Image width
            height: 100.0, // Image height
          ),
        ),
        CustomPaint(
          size: const Size(double.infinity, double.infinity),
          painter: CustomBackgroundLine2(leftMargin!),
        ),
        Positioned(
          left: leftMargin == 100 ? 85 : 75,
          top: MediaQuery.of(context).size.height / 2 -
              150.0, // Centered vertically
          child: Image.asset(
            'assets/imgs/star.png', // Replace with your image asset path
            width: 30.0, // Image width
            height: 30.0, // Image height
          ),
        ),
      ],
    );
  }
}
