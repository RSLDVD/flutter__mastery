import 'package:flutter/material.dart';

class WidgetStepperEx extends StatefulWidget {
  const WidgetStepperEx({Key? key}) : super(key: key);

  @override
  _WidgetStepperExState createState() => _WidgetStepperExState();
}

class _WidgetStepperExState extends State<WidgetStepperEx> {
  int _currentStep = 0;

  final List<Step> _steps = [
    const Step(
      title:  Text('Step 1'),
      content:  Text('This is the content of Step 1.'),
      isActive: true,
    ),
    const Step(
      title:  Text('Step 2'),
      subtitle:  Text('Step 2 subtitle'),
      content: Text('This is the content of Step 2.'),
      isActive: false,
    ),
    const Step(
      title:  Text('Step 3'),
      content: Text('This is the content of Step 3.'),
      isActive: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stepper Example'),
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < _steps.length - 1) {
            setState(() {
              _currentStep++;
            });
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep--;
            });
          }
        },
        steps: _steps,
      ),
    );
  }
}
