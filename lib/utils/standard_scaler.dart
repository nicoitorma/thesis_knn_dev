import 'dart:math' as math;

class StandardScaler {
  final List<double> _mean = [];
  final List<double> _std = [];

  StandardScaler();

  void fit(List<List<double>> X) {
    final numFeatures = X[0].length;

    for (var i = 0; i < numFeatures; i++) {
      final columnData = X.map((row) => row[i]).toList();
      final mean = _calculateMean(columnData);
      final std = _calculateStandardDeviation(columnData);

      _mean.add(mean);
      _std.add(std);
    }
  }

  List<List<double>> transform(List<List<double>> X) {
    final transformedData = <List<double>>[];

    for (var row in X) {
      final transformedRow = <double>[];

      for (var i = 0; i < row.length; i++) {
        final transformedValue = (row[i] - _mean[i]) / _std[i];
        transformedRow.add(transformedValue);
      }

      transformedData.add(transformedRow);
    }

    return transformedData;
  }

  double _calculateMean(List<double> data) {
    final sum = data.reduce((value, element) => value + element);
    return sum / data.length;
  }

  double _calculateStandardDeviation(List<double> data) {
    final mean = _calculateMean(data);
    final variance = data
            .map((value) => (value - mean) * (value - mean))
            .reduce((value, element) => value + element) /
        data.length;
    return math.sqrt(variance);
  }
}
