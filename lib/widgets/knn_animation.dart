import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class KNNAnimation extends StatefulWidget {
  const KNNAnimation({super.key});

  @override
  _KNNAnimationState createState() => _KNNAnimationState();
}

class _KNNAnimationState extends State<KNNAnimation> {
  List<Point> generateRandomPoints(int count) {
    Random random = Random(200);
    List<Point> points = [];
    for (int i = 0; i < count; i++) {
      double x = random.nextDouble();
      double y = random.nextDouble();
      Color color = Colors.primaries[random.nextInt(Colors.primaries.length)];
      points.add(Point(x, y, color));
    }
    return points;
  }

  @override
  Widget build(BuildContext context) {
    List<Point> points = generateRandomPoints(50); // Generate 10 random points

    return Center(
      child: AnimatedKNN(points),
    );
  }
}

class Point {
  final double x;
  final double y;
  final Color color;

  Point(this.x, this.y, this.color);
}

class AnimatedKNN extends StatefulWidget {
  final List<Point> points;

  const AnimatedKNN(this.points, {super.key});

  @override
  _AnimatedKNNState createState() => _AnimatedKNNState();
}

class _AnimatedKNNState extends State<AnimatedKNN>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  double animationValue = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _controller.addListener(() {
      setState(() {
        animationValue = _controller.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = const Size(500, 200);
    return CustomPaint(
      size: size,
      painter: KNNPainter(widget.points, animationValue),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class KNNPainter extends CustomPainter {
  final List<Point> points;
  final double animationValue;

  KNNPainter(this.points, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    for (Point point in points) {
      Paint pointPaint = Paint()
        ..color = point.color
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 10;

      Offset position = Offset(size.width * point.x, size.height * point.y);
      canvas.drawPoints(PointMode.points, [position], pointPaint);
    }

    // Draw circle representing neighbors
    Paint circlePaint = Paint()
      ..color = Colors.green.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    Offset center = Offset(size.width * 0.5, size.height * 0.5);
    double radius = size.width * 0.2 * animationValue;
    canvas.drawCircle(center, radius, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
