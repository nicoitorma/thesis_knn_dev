import 'dart:convert';

import 'package:csv/csv.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'knn.dart';

class KnnHelper {
  // Future<List<List>> parseCsv(String csvData) async {
  //   List<List<dynamic>> csvTable = const CsvToListConverter().convert(csvData);
  //   return csvTable.map((row) => row.map((cell) => cell).toList()).toList();
  // }
  final storageRef = FirebaseStorage.instance;
  Future getCSV(String program) async {
    List<List<dynamic>> csvData = [];

    try {
      final path = storageRef.ref('dataset/$program');
      final url = await path.getDownloadURL();
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
        data = 'CSDataset.csv';
        break;
      case 'BSIT':
        data = 'ITDataset.csv';
        break;
      case 'BSIS':
        data = 'ISDataset.csv';
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
