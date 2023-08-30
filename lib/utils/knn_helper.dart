import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

import 'knn.dart';

class KnnHelper {
  Future<List<List>> parseCsv(String csvData) async {
    List<List<dynamic>> csvTable = const CsvToListConverter().convert(csvData);
    return csvTable.map((row) => row.map((cell) => cell).toList()).toList();
  }

  Future getResults(String program, List gradesList) async {
    late final String dataset;
    dynamic result;
    switch (program) {
      case 'BSCS':
        dataset = await rootBundle.loadString('assets/datasets/CSDataset.csv');
        break;
      case 'BSIT':
        dataset = await rootBundle.loadString('assets/datasets/CSDataset.csv');
        break;
      case 'BSIS':
        dataset = await rootBundle.loadString('assets/datasets/CSDataset.csv');
        break;
    }
    List<List> trainData = await parseCsv(dataset);
    result = KNN(data: trainData).classify(gradesList, 7);

    return result;
  }
}
