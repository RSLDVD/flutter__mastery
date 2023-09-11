import 'package:flutter/material.dart';

class ReorderableListEx extends StatefulWidget {
  const ReorderableListEx({Key? key}) : super(key: key);

  @override
  __ReorderableListExState createState() => __ReorderableListExState();
}

class __ReorderableListExState extends State<ReorderableListEx> {
  final List<String> _items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
  ];

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      children: _items.map((item) {
        return ListTile(
          key: ValueKey(item),
          title: Text(item),
          trailing: const Icon(Icons.drag_handle),
        );
      }).toList(),
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (newIndex > oldIndex) {
            newIndex -= 1;
          }
          final String item = _items.removeAt(oldIndex);
          _items.insert(newIndex, item);
        });
      },
    );
  }
}
