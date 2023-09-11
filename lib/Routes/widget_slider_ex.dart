import 'package:flutter/material.dart';

class WidgetSliderEx extends StatefulWidget {
  const WidgetSliderEx({Key? key}) : super(key: key);

  @override
  _WidgetSliderExState createState() => _WidgetSliderExState();
}

class _WidgetSliderExState extends State<WidgetSliderEx> {
  double _sliderValue = 0.5;

  void _onSliderChanged(double value) {
    setState(() {
      _sliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Slider Value: ${_sliderValue.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Slider(
              value: _sliderValue,
              onChanged: _onSliderChanged,
              min: 0,
              max: 1,
              activeColor: Colors.blue,
              inactiveColor: Colors.grey,
            ),
            const SizedBox(height: 20),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.red,
                thumbColor: Colors.yellow,
                overlayColor: Colors.green.withOpacity(0.3),
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
              ),
              child: Slider(
                value: _sliderValue,
                onChanged: _onSliderChanged,
                min: 0,
                max: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
