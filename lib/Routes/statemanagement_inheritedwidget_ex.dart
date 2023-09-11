import 'package:flutter/material.dart';

void main() {
  runApp(const InheritedWidgetEx());
}

class MyTheme extends InheritedWidget {
  final ThemeData themeData;
  final Function(ThemeData) changeTheme;

  const MyTheme(
      {super.key, required this.themeData,
      required this.changeTheme,
      required Widget child})
      : super(child: child);

  static MyTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyTheme>()!;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}

class InheritedWidgetEx extends StatefulWidget {
  const InheritedWidgetEx({super.key});

  @override
  _InheritedWidgetExState createState() => _InheritedWidgetExState();
}

class _InheritedWidgetExState extends State<InheritedWidgetEx> {
  ThemeData _currentTheme = ThemeData(
    primaryColor: Colors.blue,
    hintColor: Colors.green,
  );

  void _changeTheme(ThemeData newTheme) {
    setState(() {
      _currentTheme = newTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _currentTheme,
      home: MyTheme(
        themeData: _currentTheme,
        changeTheme: _changeTheme,
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = MyTheme.of(context).themeData;

    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('InheritedWidget Theme Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Primary Color: ${theme.primaryColor}',
              style: TextStyle(color: theme.primaryColor),
            ),
            Text(
              'Accent Color: ${theme.hintColor}',
              style: TextStyle(color: theme.hintColor),
            ),
            ThemeConsumer(),
            ThemeChanger(),
          ],
        ),
      ),
    );
  }
}

class ThemeConsumer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = MyTheme.of(context).themeData;

    return Text(
      'Theme Consumer',
      style: TextStyle(color: theme.primaryColor),
    );
  }
}

class ThemeChanger extends StatefulWidget {
  const ThemeChanger({super.key});

  @override
  _ThemeChangerState createState() => _ThemeChangerState();
}

class _ThemeChangerState extends State<ThemeChanger> {
  bool _isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    final theme = MyTheme.of(context).themeData;

    return Column(
      children: [
        Switch(
          value: _isDarkTheme,
          onChanged: (value) {
            setState(() {
              _isDarkTheme = value;
              final newTheme =
                  _isDarkTheme ? ThemeData.dark() : ThemeData.light();
              MyTheme.of(context).changeTheme(newTheme);
            });
          },
        ),
        Text(
          'Switch Theme',
          style: TextStyle(color: theme.primaryColor),
        ),
      ],
    );
  }
}
