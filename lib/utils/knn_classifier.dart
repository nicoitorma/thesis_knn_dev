import 'dart:io';
import 'package:ml_algo/ml_algo.dart';
import 'package:ml_dataframe/ml_dataframe.dart';
import 'package:path_provider/path_provider.dart';

class KnnAlgorithm {
  KnnClassifier? model;

  Future getKnnModel() async {}

  applyPadding({var data}) {
    var maxSize =
        data.fold(0, (max, array) => array.length > max ? array.length : max);

    List<List<double>> paddedData = data.map((array) {
      if (array.length < maxSize) {
        return [...array, ...List<double>.filled(maxSize - array.length, 0.0)];
      } else {
        return array;
      }
    }).toList();

    return paddedData;
  }

  Future ewan() async {
    final data = <Iterable>[
      ['feature 1', 'feature 2', 'feature 3', 'outcome'],
      [5.0, 7.0, 6.0, 1.0],
      [1.0, 2.0, 3.0, 0.0],
      [10.0, 12.0, 31.0, 0.0],
      [9.0, 8.0, 5.0, 0.0],
      [4.0, 0.0, 1.0, 1.0],
    ];
    const targetName = 'outcome';
    final samples = DataFrame(data, headerExists: true);
    final classifier = KnnClassifier(
      samples,
      targetName,
      3,
    );

    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/classifier.json';

    await classifier.saveAsJson(filePath);

    final file = File(filePath);

    final json = await file.readAsString();
    final restoredClassifier = KnnClassifier.fromJson(json);
    print(file.absolute);
  }

  Future getResults(List<List> grades) async {
    final file = File('assets/knn_model/cs_knn_model.json');
    final json = await file.readAsString();
    print(json);
    final mod = KnnClassifier.fromJson(json);
    print(mod.distanceType);

    var data = DataFrame(grades);
    DataFrame? result;

    result = mod.predict(data);

    print(result);
  }
}
