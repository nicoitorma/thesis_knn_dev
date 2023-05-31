import 'dart:math';

class KNN {
  final List<List<dynamic>> data;

  const KNN({required this.data});

  /// The function takes a list of features and an integer k, calculates the Euclidean distance between
  /// the features and instances in a dataset, and returns the most common label among the k nearest
  /// instances.
  ///
  /// Args:
  ///   features (List<dynamic>): A list of dynamic values representing the features of an instance to
  /// be classified.
  ///   k (int): The number of nearest neighbors to consider for classification.
  ///
  /// Returns:
  ///   a dynamic value, which is the predicted label/classification for the given features based on the
  /// k-nearest neighbors algorithm.
  dynamic classify(List<dynamic> features, int k) {
    List<Map<String, dynamic>> distances = [];

    /// This code block is iterating over the `data` list and calculating the Euclidean distance between
    /// the `features` argument and each instance in the `data` list. It does this by creating a list of
    /// maps called `distances`, where each map contains the distance between the `features` argument
    /// and an instance in the `data` list, as well as the label of that instance. The
    /// `calculateEuclideanDistance` function is used to calculate the distance between the `features`
    /// argument and each instance's features.
    for (var i = 0; i < data.length; i++) {
      List<dynamic> instance = data[i];
      List<dynamic> instanceFeatures = instance.sublist(0, instance.length - 1);
      dynamic label = instance.last;

      double distance = calculateEuclideanDistance(features, instanceFeatures);

      distances.add({
        'distance': distance,
        'label': label,
      });
    }

    distances.sort((a, b) => a['distance'].compareTo(b['distance']));

    List<dynamic> topK = distances
        .sublist(0, min(k, distances.length))
        .map((entry) => entry['label'])
        .toList();

    dynamic result = getMostFrequentLabel(topK);
    return result;
  }

  dynamic getMostFrequentLabel(List<dynamic> labels) {
    Map<dynamic, int> countMap = {};

    for (var label in labels) {
      countMap[label] = (countMap[label] ?? 0) + 1;
    }

    List<dynamic> sortedLabels = countMap.keys.toList()
      ..sort((a, b) => countMap[b]!.compareTo(countMap[a]!));

    return sortedLabels;
  }

  /// The function calculates the Euclidean distance between two lists of features.
  ///
  /// Args:
  ///   features1 (List<dynamic>): A list of dynamic values representing the features of an object or
  /// data point.
  ///   features2 (List<dynamic>): The second list of features to calculate the Euclidean distance from
  /// the first list of features.
  ///
  /// Returns:
  ///   the Euclidean distance between two lists of features.
  double calculateEuclideanDistance(
      List<dynamic> features1, List<dynamic> features2) {
    double sum = 0;

    for (var i = 0; i < features1.length; i++) {
      double diff = features1[i] - features2[i];
      sum += pow(diff, 2);
    }

    return sqrt(sum);
  }
}
