import 'package:flutter/material.dart';

class CustomAnimatedWidgetEx extends StatefulWidget {
  @override
  _CustomAnimatedWidgetExState createState() => _CustomAnimatedWidgetExState();
}

class _CustomAnimatedWidgetExState extends State<CustomAnimatedWidgetEx> {
  double _opacity = 1.0;

  void toggleOpacity() {
    setState(() {
      _opacity = _opacity == 1.0 ? 0.0 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Animated Widget')),
      body: Center(
        child: CustomOpacityAnimatedWidget(
          opacity: _opacity,
          duration: const Duration(seconds: 1),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Hello',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleOpacity,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}

class CustomOpacityAnimatedWidget extends ImplicitlyAnimatedWidget {
  final double opacity;
  final Widget child;

  const CustomOpacityAnimatedWidget({
    required this.opacity,
    required Duration duration,
    required this.child,
  }) : super(duration: duration);

  @override
  _CustomOpacityAnimatedWidgetState createState() =>
      _CustomOpacityAnimatedWidgetState();
}

class _CustomOpacityAnimatedWidgetState
    extends AnimatedWidgetBaseState<CustomOpacityAnimatedWidget> {
  Tween<double>? _opacity;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _opacity = visitor(
      _opacity,
      widget.opacity,
      (dynamic value) => Tween<double>(begin: value as double),
    ) as Tween<double>?;
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacity?.evaluate(animation) ?? 1.0,
      child: widget.child,
    );
  }
}
