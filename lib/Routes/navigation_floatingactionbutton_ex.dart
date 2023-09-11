import 'package:flutter/material.dart';



class FloatingActionButtonScreenEX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAB & Navigation Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailScreen()),
            );
          },
          child: const Text('Go to Detail Screen'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add custom action for the FloatingActionButton
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('FAB Pressed')),
          );
        },
        tooltip: 'Show Snackbar',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
      ),
      body: const Center(
        child: Text('This is the detail screen.'),
      ),
    );
  }
}
