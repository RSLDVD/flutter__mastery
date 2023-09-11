import 'package:flutter/material.dart';

class WidgetPlaceHolderEx extends StatelessWidget {
  const WidgetPlaceHolderEx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Placeholder Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Placeholder(
              color: Colors.blue,
              fallbackHeight: 100,
              fallbackWidth: 100,
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Placeholder(
                color: Colors.green,
                fallbackHeight: 150,
                fallbackWidth: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
