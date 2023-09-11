import 'package:flutter/material.dart';

class WidgetIconEx extends StatelessWidget {
  const WidgetIconEx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.flutter_dash_sharp, size: 40.0, color: Colors.green[400]),
            Icon(Icons.home, size: 40.0, color: Colors.red[200]),
            const Icon(Icons.add_alarm_sharp, size: 40.0, color: Colors.black45),
            Icon(Icons.remove_circle, size: 40.0, color: Colors.blue[600]),
            Icon(Icons.accessible_forward, size: 40.0, color: Colors.purple[200]),
          ],
        ),
      ),
    );
  }
}
