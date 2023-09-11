import 'package:flutter/material.dart';

class ListWheelViewEx extends StatefulWidget {
  const ListWheelViewEx({super.key});

  @override
  _ListWheelViewExeState createState() => _ListWheelViewExeState();
}

class _ListWheelViewExeState extends State<ListWheelViewEx> {
  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView.useDelegate(
      itemExtent: 100,
      diameterRatio: 2.5,
      physics: const FixedExtentScrollPhysics(),
      childDelegate: ListWheelChildBuilderDelegate(
        builder: (BuildContext context, int index) {
          if (index < 0 || index > 8) {
            return null;
          }
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blue,
              child: Text(
                "$index",
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            title: Text("Title $index"),
            subtitle: const Text('Description here'),
            trailing: const Icon(Icons.arrow_forward),
          );
        },
      ),
    );
  }
}
