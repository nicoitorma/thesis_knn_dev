import 'dart:io';
import 'package:ml_dataframe/ml_dataframe.dart';
import 'package:ml_algo/ml_algo.dart';
import 'package:th_knn/models/grades.dart';
import 'package:th_knn/utils/standard_scaler.dart';

class KnnAlgorithm {
  KnnClassifier? model;

  Future getKnnModel() async {
    final file = File('assets/knn_model/cs_knn_model.json');
    final json = await file.readAsString();
    model = KnnClassifier.fromJson(json);
  }

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

  Future getResults(List<Grades> grades) async {
    DataFrame? data;
    List<List<double>>? filtereredGrades = [];
    List<double>? innerList = [];
    final scaler = StandardScaler();

    for (var grade in grades) {
      innerList.add(grade.rating!);
    }

    final mData = applyPadding(data: innerList);
    scaler.fit(mData);
    final transformedData = scaler.transform(mData);

    print(transformedData.runtimeType);
    print(transformedData);

    //return transformedData;

    // return model?.predict(data);
  }
}
