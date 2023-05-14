import 'package:flutter/material.dart';
import 'package:th_knn/drawables/bg.dart';
import 'package:th_knn/layouts/header.dart';

class CheckCareer extends StatefulWidget {
  const CheckCareer({super.key});

  @override
  State<CheckCareer> createState() => _CheckCareerState();
}

class _CheckCareerState extends State<CheckCareer> {
  final List<List<String>> _data = [
    ['Course Code', 'Units', 'Grades'],
    ['Row 2', 'Value 4', 'Value 5'],
    ['Row 3', 'Value 7', 'Value 8'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backgroundImage,
          const Header(),
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                columns: _data[0].map((String title) {
                  return DataColumn(
                    label: Text(title),
                  );
                }).toList(),
                rows: _data.skip(1).map((List<String> rowData) {
                  return DataRow(
                    cells: rowData.map((String value) {
                      return DataCell(
                        TextFormField(
                          initialValue: value,
                          onChanged: (newValue) {
                            setState(() {
                              rowData[rowData.indexOf(value)] = newValue;
                            });
                          },
                        ),
                      );
                    }).toList(),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
