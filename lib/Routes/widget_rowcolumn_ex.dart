import 'package:flutter/material.dart';

class WidgetRowColumnEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row, Column & Expanded Example'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  ColorBox(
                    color: Colors.pink,
                  ),
                  ColorBox(color: Colors.green),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                children: const [
                  ColorBox(color: Colors.orange),
                  ColorBox(color: Colors.purple),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 400,
                child: Column(
                  children: const [
                    Expanded(
                      flex: 1,
                      child: ColorBox(color: Colors.red),
                    ),
                    Expanded(
                      flex: 3,
                      child: ColorBox(color: Colors.teal),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  Expanded(
                    flex: 2,
                    child: ColorBox(color: Colors.yellow),
                  ),
                  Expanded(
                    flex: 3,
                    child: ColorBox(color: Colors.indigo),
                  ),
                  Expanded(
                    flex: 1,
                    child: ColorBox(color: Colors.cyan),
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

class ColorBox extends StatelessWidget {
  final Color color;

  const ColorBox({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}
