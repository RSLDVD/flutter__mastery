import 'package:flutter/material.dart';

class WidgetStackEx extends StatefulWidget {
  const WidgetStackEx({Key? key}) : super(key: key);

  @override
  _WidgetStackExeState createState() => _WidgetStackExeState();
}

class _WidgetStackExeState extends State<WidgetStackEx> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack & IndexedStack Example'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    color: Colors.grey,
                  ),
                  Positioned(
                    top: 50,
                    left: 50,
                    child: Container(
                      width: 150,
                      height: 150,
                      color: Colors.red,
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    right: 50,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.green,
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 50,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.cyan,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              IndexedStack(
                index: _currentIndex,
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    color: Colors.orange,
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    color: Colors.yellow,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentIndex = 0;
                      });
                    },
                    child: const Text('Page 1'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentIndex = 1;
                      });
                    },
                    child: const Text('Page 2'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentIndex = 2;
                      });
                    },
                    child: const Text('Page 3'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
