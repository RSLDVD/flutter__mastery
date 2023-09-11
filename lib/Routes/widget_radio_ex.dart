import 'package:flutter/material.dart';

class WidgetRadioEx extends StatefulWidget {
  const WidgetRadioEx({Key? key}) : super(key: key);

  @override
  State<WidgetRadioEx> createState() => _WidgetRadioExState();
}

enum Gender { male, female, other }

class _WidgetRadioExState extends State<WidgetRadioEx> {
  Gender? _selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: const Text('Male'),
              leading: Radio<Gender>(
                value: Gender.male,
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Female'),
              leading: Radio<Gender>(
                value: Gender.female,
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Other'),
              leading: Radio<Gender>(
                value: Gender.other,
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
