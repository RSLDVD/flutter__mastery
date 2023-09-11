import 'package:flutter/material.dart';



class WidgetStatefulEx extends StatefulWidget {
  const WidgetStatefulEx({Key? key}) : super(key: key);

  @override
  _StatefulWidgetExampleState createState() => _StatefulWidgetExampleState();
}

class _StatefulWidgetExampleState extends State<WidgetStatefulEx> {
  bool _isHighlighted = false;

  void _toggleHighlight() {
    setState(() {
      _isHighlighted = !_isHighlighted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StatefulWidget Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColoredBoxWidget(isHighlighted: _isHighlighted),
            const SizedBox(height: 20),
            ToggleButtonWidget(
              isHighlighted: _isHighlighted,
              onPressed: _toggleHighlight,
            ),
          ],
        ),
      ),
    );
  }
}

class ColoredBoxWidget extends StatelessWidget {
  final bool isHighlighted;

  const ColoredBoxWidget({required this.isHighlighted});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      color: isHighlighted ? Colors.amber : Colors.grey,
      child: Center(
        child: Text(
          isHighlighted ? 'Highlighted' : 'Not Highlighted',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class ToggleButtonWidget extends StatelessWidget {
  final bool isHighlighted;
  final VoidCallback onPressed;

   const ToggleButtonWidget({Key? key, 
    required this.isHighlighted,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(isHighlighted ? 'Turn Off' : 'Turn On'),
    );
  }
}
