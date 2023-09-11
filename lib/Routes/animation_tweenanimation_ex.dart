import 'package:flutter/material.dart';

class TweenAnimationsEx extends StatefulWidget {
  @override
  _TweenAnimationsExState createState() => _TweenAnimationsExState();
}

class _TweenAnimationsExState extends State<TweenAnimationsEx>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (BuildContext context, Widget? child) {
            return Container(
              width: 250,
              height: 250,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Opacity(
                opacity: _animation.value,
                child: const Text(
                  'Tween Animations by opacity ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


