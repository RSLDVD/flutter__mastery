// Code Example: Navigator Methods in Navigation

import 'package:flutter/material.dart';

void main() {
  runApp(NavigationMethodsEx());
}

class NavigationMethodsEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Methods Example',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/detail': (context) => DetailScreen(),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigation Methods Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailScreen()));
              },
              child: const Text('Go to Detail Screen (Navigator.push)'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()));
              },
              child: const Text(
                  'Replace with Settings Screen (Navigator.pushReplacement)'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/settings');
              },
              child: const Text(
                  'Pop and Push to Settings Screen (Navigator.popAndPushNamed)'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
              child: const Text(
                  'Push Named and Remove All Screens (Navigator.pushNamedAndRemoveUntil)'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/detail');
              },
              child: const Text(
                  'Replace with Detail Screen (Navigator.pushReplacementNamed)'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Back to Home (Navigator.pop)'),
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Back to Home (Navigator.pop)'),
        ),
      ),
    );
  }
}
