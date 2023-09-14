import 'dart:convert';

import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;
import 'knn.dart';

class KnnHelper {
  // Future<List<List>> parseCsv(String csvData) async {
  //   List<List<dynamic>> csvTable = const CsvToListConverter().convert(csvData);
  //   return csvTable.map((row) => row.map((cell) => cell).toList()).toList();
  // }
  Future getCSV(String url) async {
    List<List<dynamic>> csvData = [];

    try {
      // final path = storageRef.ref('dataset/$program');
      // final url = await path.getDownloadURL();
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final String content = utf8.decode(response.bodyBytes);
        final List<List<dynamic>> rowsAsListOfValues =
            const CsvToListConverter().convert(content);
        if (rowsAsListOfValues.isNotEmpty) {
          rowsAsListOfValues.removeAt(0);
          csvData = rowsAsListOfValues;
          return csvData;
        }
      }
    } catch (e) {
      print('Error retrieving CSV: $e');
    }
  }

  Future getResults(String program, List gradesList) async {
    late String data;
    dynamic result;
    switch (program) {
      case 'BSCS':
        data =
            'https://firebasestorage.googleapis.com/v0/b/ocg-knn.appspot.com/o/dataset%2FCSDataset.csv?alt=media&token=b0ffecdb-f103-4bec-b3f5-9fd2732bdac2';
        break;
      case 'BSIT':
        data =
            'https://firebasestorage.googleapis.com/v0/b/ocg-knn.appspot.com/o/dataset%2FITDataset.csv?alt=media&token=fc028f8f-4758-4d84-a81c-ad9e3f812bc4';
        break;
      case 'BSIS':
        data =
            'https://firebasestorage.googleapis.com/v0/b/ocg-knn.appspot.com/o/dataset%2FISDataset.csv?alt=media&token=bed8342c-88d2-40cf-bf2f-1e8423d15';
        break;
    }
    try {
      List<List> csv = await getCSV(data);
      result = KNN(data: csv).classify(gradesList, 10);
    } catch (e) {
      print('Error: $e');
    }

    return result;
  }
}
