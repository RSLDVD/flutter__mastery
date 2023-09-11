import 'package:flutter/material.dart';

class ListTileEx extends StatelessWidget {
  const ListTileEx({Key? key});

  @override
  Widget build(BuildContext context) {
    final listTiles = <Widget>[
      const ListTile(
        title: Text('Tile A: basic'),
      ),
      const Divider(),
      const ListTile(
        leading: Icon(Icons.star),
        title: Text('Tile B: with leading/trailing icons'),
        trailing: Icon(Icons.favorite),
      ),
      const Divider(),
      const ListTile(
        title: Text('Tile C title'),
        subtitle: Text('subtitle of Tile C'),
      ),
      const Divider(),
      const ListTile(
        title: Text('Tile D: 3 lines'),
        isThreeLine: true,
        subtitle: Text('subtitle of Tile D'),
      ),
      const Divider(),
      const ListTile(
        title: Text('Tile E: compact'),
        dense: true,
      ),
      const Divider(),
      const ListTile(
        title: Text('Tile F: tile with badge'),
        subtitle: Text('(This uses the badges package)'),
        trailing: Chip(
          label: Text('5'),
          avatar: Icon(Icons.message),
        ),
      ),
    ];

    return ListView(children: listTiles);
  }
}
