import 'package:flutter/material.dart';



class DataTableEx extends StatefulWidget {
  @override
  _DataTableExState createState() => _DataTableExState();
}

class _DataTableExState extends State<DataTableEx> {
  List<DataRow>? rows;

  @override
  void initState() {
    super.initState();
    rows = [
      DataRow(cells: [
        const DataCell(Text('John')),
        const DataCell( Text('Doe')),
        const DataCell( Text('30')),
        DataCell(Checkbox(
          value: false,
          onChanged: (value) {
            setState(() {
              rows?[0].cells[3] = DataCell(Checkbox(value: value, onChanged: (value) {}));
            });
          },
        )),
      ]),
      DataRow(cells: [
        const DataCell(Text('Jane')),
        const DataCell(Text('Smith')),
        const DataCell(Text('25')),
        DataCell(Checkbox(
          value: true,
          onChanged: (value) {
            setState(() {
              rows?[1].cells[3] = DataCell(Checkbox(value: value, onChanged: (value) {}));
            });
          },
        )),
      ]),
      DataRow(cells: [
        const DataCell( Text('Robert')),
        const DataCell(Text('Johnson')),
        const DataCell(Text('40')),
        DataCell(Checkbox(
          value: false,
          onChanged: (value) {
            setState(() {
              rows?[2].cells[3] = DataCell(Checkbox(value: value, onChanged: (value) {}));
            });
          },
        )),
      ]),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label:  Text('First Name')),
          DataColumn(label: Text('Last Name')),
          DataColumn(label:  Text('Age')),
          DataColumn(label:  Text('Select')),
        ],
        rows: rows!,
      ),
    );
  }
}