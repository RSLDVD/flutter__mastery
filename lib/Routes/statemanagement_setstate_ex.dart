import 'package:flutter/material.dart';

class SetstateEx extends StatefulWidget {
  @override
  _SetstateExState createState() => _SetstateExState();
}

class _SetstateExState extends State<SetstateEx> {
  String text = 'Initial Text';
  int counter = 0;

  void _updateText() {
    setState(() {
      text = 'Updated Text';
    });
  }

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('setState Example'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text,
                style: const TextStyle(fontSize: 24),
              ),
              ElevatedButton(
                onPressed: _updateText,
                child: const Text('Change Text'),
              ),
              const Divider(),
              Text(
                'Counter: $counter',
                style: const TextStyle(fontSize: 24),
              ),
              ElevatedButton(
                onPressed: _incrementCounter,
                child: const Text('Increment Counter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
