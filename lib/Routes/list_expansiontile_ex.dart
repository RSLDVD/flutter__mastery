import 'package:flutter/material.dart';



class ExpansionTileEx extends StatelessWidget {
  const ExpansionTileEx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        ExpansionTile(
          title: Text('Category A'),
          children: <Widget>[
            ExpansionTile(
              title: Text('Subcategory A1'),
              children: <Widget>[
                ListTile(title: Text('Item A1.1')),
                ListTile(title: Text('Item A1.2')),
              ],
            ),
            ListTile(title: Text('Item A2')),
            ListTile(title: Text('Item A3')),
          ],
        ),
        ExpansionTile(
          title: Text('Category B'),
          children: <Widget>[
            ListTile(title: Text('Item B1')),
            ListTile(title: Text('Item B2')),
          ],
        ),
        ExpansionTile(
          title: Text('Category C'),
          children: <Widget>[
            ListTile(title: Text('Item C1')),
            ListTile(title: Text('Item C2')),
            ExpansionTile(
              title: Text('Subcategory C3'),
              children: <Widget>[
                ListTile(title: Text('Item C3.1')),
                ListTile(title: Text('Item C3.2')),
              ],
            ),
          ],
        ),
      ],
    );
  }
}