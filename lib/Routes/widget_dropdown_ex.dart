import 'package:flutter/material.dart';

class WidgetDropDownEx extends StatefulWidget {
  const WidgetDropDownEx({Key? key}) : super(key: key);

  @override
  State<WidgetDropDownEx> createState() => _WidgetDropDownExState();
}

class _WidgetDropDownExState extends State<WidgetDropDownEx> {
 String _selectedFruit = 'Apple';
  final List<String> _fruits = ['Apple', 'Banana', 'Orange', 'Grapes'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown Example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DropdownButton<String>(
                value: _selectedFruit,
                onChanged: (newValue) {
                  setState(() {
                    _selectedFruit = newValue!;
                  });
                },
                items: _fruits.map((String fruit) {
                  return DropdownMenuItem<String>(
                    value: fruit,
                    child: Text(fruit),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              DropdownButton<String>(
                value: _selectedFruit,
                onChanged: (newValue) {
                  setState(() {
                    _selectedFruit = newValue!;
                  });
                },
                items: _fruits.map((String fruit) {
                  return DropdownMenuItem<String>(
                    value: fruit,
                    child: Row(
                      children: <Widget>[
                        const Icon(Icons.favorite, color: Colors.red),
                        const SizedBox(width: 10),
                        Text(fruit),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}