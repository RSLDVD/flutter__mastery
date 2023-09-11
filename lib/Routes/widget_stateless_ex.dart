import 'package:flutter/material.dart';

class WidgetStatelessEx extends StatelessWidget {
  const WidgetStatelessEx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StatelessWidget Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StatelessWidgetExample(),
    );
  }
}

class StatelessWidgetExample extends StatelessWidget {
  const StatelessWidgetExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StatelessWidget Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ColoredBoxWidget(),
            const SizedBox(height: 20),
            RoundedButtonWidget(
              buttonText: 'Click Me',
              onPressed: () {
                // Perform an action
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ColoredBoxWidget extends StatelessWidget {
  const ColoredBoxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      color: Colors.blue,
      child: const Center(
        child: Text(
          'Colored Box',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class RoundedButtonWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

   const RoundedButtonWidget({Key? key, 
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(buttonText),
    );
  }
}