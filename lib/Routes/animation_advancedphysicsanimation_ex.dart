import 'package:flutter/material.dart';

class AdvancedPhysicsAnimationEx extends StatefulWidget {
  @override
  _AdvancedPhysicsAnimationExState createState() =>
      _AdvancedPhysicsAnimationExState();
}

class _AdvancedPhysicsAnimationExState extends State<AdvancedPhysicsAnimationEx>
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
    _animation = Tween<double>(begin: 0, end: 200).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    )..addListener(() {
        setState(() {});
      });

    _controller
        .forward()
        .then((value) => _controller.reverse())
        .then((value) => _controller.repeat());
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
        title: const Text('Advanced Physics-based Animation'),
      ),
      body: Center(
        child: Container(
          width: _animation.value,
          height: _animation.value,
          color: Colors.blue,
        ),
      ),
    );
  }
}
