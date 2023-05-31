import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

import 'knn.dart';

class KnnAlgorithm {
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

  Future<List<List>> parseCsv(String csvData) async {
    List<List<dynamic>> csvTable = const CsvToListConverter().convert(csvData);
    return csvTable.map((row) => row.map((cell) => cell).toList()).toList();
  }

  Future getResults(String program, List<List> grades) async {
    late final String dataset;

    switch (program) {
      case 'BSCS':
        dataset = await rootBundle.loadString('assets/knn_model/CSDataset.csv');
        break;
      case 'BSIT':
        dataset = await rootBundle.loadString('assets/knn_model/CSDataset.csv');
        break;
      case 'BSIS':
        dataset = await rootBundle.loadString('assets/knn_model/CSDataset.csv');
        break;
    }

    List<double> gradesList = [
      2.1,
      2.3,
      2.1,
      2.3,
      2.4,
      1.5,
      1.3,
      2.9,
      1.9,
      2.5,
      2.2,
      1.1,
      2.3,
      2,
      1.5,
      1.4,
      2.1,
      2.2,
      2.1,
      1.1,
      1.7
    ];

    List<List> trainData = await parseCsv(dataset);
    dynamic result = KNN(data: trainData).classify(gradesList, 7);

    print('The predicted label is: $result');
  }
}
