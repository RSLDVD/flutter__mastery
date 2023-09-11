import 'package:flutter/material.dart';

class ListViewBuilderEx extends StatelessWidget {
   const ListViewBuilderEx({Key? key});

  @override
  Widget build(BuildContext context) {
    const numItems = 20;
    const biggerFont = TextStyle(fontSize: 18.0);

    Widget _buildRow(int idx) {
      return Dismissible(
        key: Key('item$idx'),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          // Add code here to handle item dismissal
        },
        background: Container(
          alignment: Alignment.centerRight,
          color: Colors.red,
          child: const Icon(Icons.delete, color: Colors.white),
        ),
        child: ListTile(
          leading: CircleAvatar(
            child: Text('$idx'),
          ),
          title: Text(
            'Updated Item $idx',
            style: biggerFont,
          ),
          trailing: const Icon(Icons.edit),
        ),
      );
    }

    return ListView.builder(
      itemCount: numItems * 2,
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (BuildContext context, int i) {
        if (i.isOdd) return const Divider();
        final index = i ~/ 2 + 1;
        return _buildRow(index);
      },
    );
  }
}


