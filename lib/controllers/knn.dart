import 'dart:math';

class KNN {
  final List<List<dynamic>> data;

  const KNN({required this.data});

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

    return topK;
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
