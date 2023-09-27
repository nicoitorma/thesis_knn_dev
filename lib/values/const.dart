import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:th_knn/widgets/barchart.dart';

const Duration duration = Duration(milliseconds: 300);
List<Color> barChartColors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.purple,
  Colors.amber,
  Colors.brown
];

class RandomBarGraph extends StatefulWidget {
  const RandomBarGraph({super.key});

  @override
  State<RandomBarGraph> createState() => _RandomBarGraphState();
}

class _RandomBarGraphState extends State<RandomBarGraph> {
  Map<int, int> randomNumberMap = {};
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      generateRandomNumbers();
    });
  }

  void generateRandomNumbers() {
    Random random = Random();
    randomNumberMap.clear();

    for (int i = 0; i < random.nextInt(6) + 3; i++) {
      int randomNumber =
          random.nextInt(6) + 1; // Generates a random number between 0 and 5
      randomNumberMap[i] = randomNumber;
    }

    setState(() {
      randomNumberMap = randomNumberMap;
    }); // Update the UI to reflect the new random numbers
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BarChartWidget(data: randomNumberMap, colors: barChartColors);
  }
}
