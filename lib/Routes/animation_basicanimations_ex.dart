import 'package:flutter/material.dart';

class BasicAnimationsEx extends StatefulWidget {
  const BasicAnimationsEx({Key? key}) : super(key: key);

  @override
  _BasicAnimationsExState createState() => _BasicAnimationsExState();
}

class _BasicAnimationsExState extends State<BasicAnimationsEx> {
  bool _isVisible = true;
  double _containerWidth = 200.0;
  double _containerHeight = 200.0;
  double _opacityValue = 1.0;
  bool _isCrossFaded = false;
  double _paddingValue = 16.0;
  Alignment _alignment = Alignment.center;
  double _fontSize = 16.0;
  bool _isPhysicalModel = false;
  double _elevation = 0.0;
  double _size = 200.0;
  int _switcherIndex = 0;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _toggleCrossFade() {
    setState(() {
      _isCrossFaded = !_isCrossFaded;
    });
  }

  void _changePadding() {
    setState(() {
      _paddingValue = _paddingValue == 16.0 ? 32.0 : 16.0;
    });
  }

  void _changeAlignment() {
    setState(() {
      _alignment =
          _alignment == Alignment.center ? Alignment.topLeft : Alignment.center;
    });
  }

  void _togglePhysicalModel() {
    setState(() {
      _isPhysicalModel = !_isPhysicalModel;
      _elevation = _isPhysicalModel ? 40.0 : 0.0;
    });
  }

  void _toggleSize() {
    setState(() {
      _size = _size == 200.0 ? 100.0 : 200.0;
    });
  }

  void _switcherNext() {
    setState(() {
      _switcherIndex = (_switcherIndex + 1) % 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.1,
              duration: const Duration(seconds: 1),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlutterLogo(
                    size: 150,
                  ),
                  Text('AnimatedOpacity'),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            // AnimatedContainer(
            //   width: _containerWidth,
            //   height: _containerHeight,
            //   color: Colors.blue,
            //   duration: const Duration(seconds: 1),
            //   curve: Curves.easeInOut,
            //   child: const FlutterLogo(),
            // ),
            const SizedBox(height: 16.0),
            AnimatedCrossFade(
              firstChild: Column(
                children: const [
                  FlutterLogo(
                    size: 120,
                  ),
                  Text('AnimatedCrossFade'),
                ],
              ),
              secondChild: const FlutterLogo(
                size: 200,
              ),
              crossFadeState: _isCrossFaded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 177),
            ),
            const SizedBox(height: 16.0),
            Container(
              color: Colors.grey,
              child: AnimatedPadding(
                padding: EdgeInsets.all(_paddingValue),
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                child: const Column(
                  children: [
                    FlutterLogo(
                      size: 150,
                    ),
                    Text('AnimatedPadding')
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            AnimatedAlign(
              alignment: _alignment,
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              child: const Column(
                children: [
                  FlutterLogo(
                    size: 150,
                  ),
                  Text('AnimatedAlign')
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            // AnimatedDefaultTextStyle(
            //   style: TextStyle(
            //     color: Colors.blue,
            //     fontSize: _fontSize,
            //     fontWeight: FontWeight.bold,
            //   ),
            //   duration: const Duration(seconds: 2),
            //   child: const Text('Animated Text'),
            // ),
            const SizedBox(height: 16.0),
            AnimatedPhysicalModel(
              shape: BoxShape.rectangle,
              color: Colors.green,
              elevation: _elevation,
              duration: const Duration(seconds: 1),
              shadowColor: Colors.grey,
              child: const Column(
                children: [
                  FlutterLogo(
                    size: 150,
                  ),
                  Text('AnimatedPhysicalModel')
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            AnimatedSize(
              //vsync: this,
              duration: const Duration(seconds: 1),
              child: Column(
                children: [
                  FlutterLogo(
                    size: _size,
                  ),
                  const Text('AnimatedSize')
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              key: ValueKey<int>(_switcherIndex),
              child: _switcherIndex == 0
                  ? const FlutterLogo(
                      size: 150,
                    )
                  : _switcherIndex == 1
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 150,
                        )
                      : const Text(
                          'Animated Switcher',
                          style: TextStyle(fontSize: 24.0),
                        ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _toggleVisibility,
            child: const Icon(Icons.visibility),
          ),
          const SizedBox(height: 16.0),
          FloatingActionButton(
            onPressed: _toggleCrossFade,
            child: const Icon(Icons.compare_arrows),
          ),
          const SizedBox(height: 16.0),
          FloatingActionButton(
            onPressed: _changePadding,
            child: const Icon(Icons.format_indent_increase),
          ),
          const SizedBox(height: 16.0),
          FloatingActionButton(
            onPressed: _changeAlignment,
            child: const Icon(Icons.format_align_center),
          ),
          const SizedBox(height: 16.0),
          FloatingActionButton(
            onPressed: _togglePhysicalModel,
            child: const Icon(Icons.layers),
          ),
          const SizedBox(height: 16.0),
          FloatingActionButton(
            onPressed: _toggleSize,
            child: const Icon(Icons.aspect_ratio),
          ),
          const SizedBox(height: 16.0),
          FloatingActionButton(
            onPressed: _switcherNext,
            child: const Icon(Icons.repeat),
          ),
        ],
      ),
    );
  }
}
