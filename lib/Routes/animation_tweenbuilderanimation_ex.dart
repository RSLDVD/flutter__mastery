import 'package:flutter/material.dart';

class TweenBuilderAnimationEx extends StatefulWidget {
  @override
  _TweenBuilderAnimationExState createState() =>
      _TweenBuilderAnimationExState();
}

class _TweenBuilderAnimationExState extends State<TweenBuilderAnimationEx> {
  double _opacity = 0.0;
  double _size = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: _opacity),
              duration: const Duration(seconds: 2),
              builder: (BuildContext context, double value, Widget? child) {
                return Opacity(
                  opacity: value,
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.blue,
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 100, end: _size),
              duration: const Duration(seconds: 2),
              builder: (BuildContext context, double value, Widget? child) {
                return Container(
                  width: value,
                  height: value,
                  color: Colors.red,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _opacity = _opacity == 0.0 ? 1.0 : 0.0;
            _size = _size == 100.0 ? 200.0 : 100.0;
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
