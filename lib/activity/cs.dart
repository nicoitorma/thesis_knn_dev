import 'package:flutter/services.dart';
import 'package:ml_algo/ml_algo.dart';
import 'package:ml_dataframe/ml_dataframe.dart';
import 'package:ml_preprocessing/ml_preprocessing.dart';
import 'package:path_provider/path_provider.dart';

class TrainKNN {
  late DataFrame dataFrame;

  Future preprocess() async {
    final data = await rootBundle.loadString('assets/knn_model/CSDataset.csv');
    final dataframe = DataFrame.fromRawCsv(data);
    final encoder = Encoder.label(
      dataframe,
      columnNames: ['CAREER'],
    );
    dataFrame = encoder.process(dataframe);
  }

  Future train() async {
    await preprocess();
    print(dataFrame.runtimeType);
    const targetName = 'CAREER';
    final model = KnnClassifier(
      dataFrame,
      targetName,
      7,
    );

    final dir = await getExternalStorageDirectory();
    await model.saveAsJson('${dir!.path}/csModel.json');

    print(dir.path);
  }
}
