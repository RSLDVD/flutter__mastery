import 'package:flutter/material.dart';

class AdvancedGestureAnimationEx extends StatefulWidget {
  @override
  _AdvancedGestureAnimationExState createState() =>
      _AdvancedGestureAnimationExState();
}

class _AdvancedGestureAnimationExState extends State<AdvancedGestureAnimationEx>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  double _startPosition = 0.0;
  double _endPosition = 0.0;
  double _dragPosition = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  void _onDragStart(BuildContext context, DragStartDetails details) {
    _startPosition = details.localPosition.dx;
  }

  void _onDragUpdate(BuildContext context, DragUpdateDetails details) {
    _dragPosition = details.localPosition.dx;
    final dragDelta = _dragPosition - _startPosition;
    _controller.value = dragDelta / context.size!.width;
  }

  void _onDragEnd(BuildContext context, DragEndDetails details) {
    _endPosition = _dragPosition;
    final dragDelta = _endPosition - _startPosition;
    final fractionDragged = dragDelta / context.size!.width;
    _controller.forward();
    if (fractionDragged < -0.5 || fractionDragged > 0.5) {
      _controller.reverse();
    }
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
        title: const Text('Advanced Gesture-based Animation'),
      ),
      body: GestureDetector(
        onHorizontalDragStart: (details) => _onDragStart(context, details),
        onHorizontalDragUpdate: (details) => _onDragUpdate(context, details),
        onHorizontalDragEnd: (details) => _onDragEnd(context, details),
        child: Center(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(_animation.value * 200, 0),
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Swipe me!',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
