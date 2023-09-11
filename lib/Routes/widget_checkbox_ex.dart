import 'package:flutter/material.dart';

class WidgetCheckBoxEx extends StatefulWidget {
  const WidgetCheckBoxEx({Key? key}) : super(key: key);

  @override
  State<WidgetCheckBoxEx> createState() => _WidgetCheckBoxEx();
}

class _WidgetCheckBoxEx extends State<WidgetCheckBoxEx> {
  bool? _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
              onChanged: (value) {
                setState(() {
                  _isChecked = value;
                });
              },
              value: _isChecked,
            ),
            const SizedBox(height: 20),
            Text(
              'Checkbox is ${_isChecked ?? false ? "checked" : "unchecked"}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
