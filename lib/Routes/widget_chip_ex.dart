import 'package:flutter/material.dart';

class WidgetChipEx extends StatefulWidget {
  const WidgetChipEx({Key? key}) : super(key: key);

  @override
  State<WidgetChipEx> createState() => _WidgetChipExState();
}

class _WidgetChipExState extends State<WidgetChipEx> {
  final List<String> _selectedLanguages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chip Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Wrap(
              spacing: 10.0,
              children: const <Widget>[
                Chip(
                  label: Text('Flutter'),
                ),
                Chip(
                  avatar: CircleAvatar(child: Icon(Icons.home)),
                  label: Text('Dart'),
                  backgroundColor: Colors.green,
                  labelStyle: TextStyle(color: Colors.white),
                ),
                Chip(
                  label: Text('Widgets'),
                  backgroundColor: Colors.blue,
                  labelStyle: TextStyle(color: Colors.white),
                ),
                Chip(
                  label: Text('Material Design'),
                  backgroundColor: Colors.deepPurple,
                  labelStyle: TextStyle(color: Colors.white),
                ),
                Chip(
                  label: Text('Responsive UI'),
                  backgroundColor: Colors.amber,
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 8.0,
              children: <Widget>[
                FilterChip(
                  checkmarkColor: Colors.pink,
                  label: const Text('Web Development'),
                  selected: _selectedLanguages.contains('Web Development'),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _selectedLanguages.add('Web Development');
                      } else {
                        _selectedLanguages.remove('Web Development');
                      }
                    });
                  },
                ),
                FilterChip(
                  avatar: const CircleAvatar(child: Icon(Icons.android),),
                  label: const Text('Mobile Development'),
                  selected: _selectedLanguages.contains('Mobile Development'),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _selectedLanguages.add('Mobile Development');
                      } else {
                        _selectedLanguages.remove('Mobile Development');
                      }
                    });
                  },
                ),
                FilterChip(
                  backgroundColor: Colors.amberAccent,
                  label: const Text('Backend Development'),
                  selected: _selectedLanguages.contains('Backend Development'),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _selectedLanguages.add('Backend Development');
                      } else {
                        _selectedLanguages.remove('Backend Development');
                      }
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
