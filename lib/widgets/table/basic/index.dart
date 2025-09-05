import 'package:flutter/material.dart';

class CBasicDataTableWidget extends StatelessWidget {
  final List<List<String>> data;

  const CBasicDataTableWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const Center(child: Text("No data to display."));
    }

    final List<TableRow> tableRows = data.map((row) {
      return TableRow(
        children: row.map((cell) {
          return TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(cell),
            ),
          );
        }).toList(),
      );
    }).toList();

    return Table(
      border: TableBorder.all(color: Colors.grey),
      // columnWidths: const {
      //   0: FlexColumnWidth(1),
      //   1: FlexColumnWidth(2),
      //   2: FlexColumnWidth(1),
      // },
      children: tableRows,
    );
  }
}