import 'package:flutter/material.dart';

class AdvancedCurvedAnimationEx extends StatefulWidget {
  @override
  _AdvancedCurvedAnimationExState createState() => _AdvancedCurvedAnimationExState();
}

class _AdvancedCurvedAnimationExState extends State<AdvancedCurvedAnimationEx>
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
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Curved Animation'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (BuildContext context, Widget? child) {
            return Transform.scale(
              scale: _animation.value,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ),
            );
          },
        ),
      ),
    );
  }
}
