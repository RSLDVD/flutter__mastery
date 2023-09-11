import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  late AnimationController _animationController;
  

  AnimationController get animationController => _animationController;

  bool get isDarkMode => _isDarkMode;

  bool toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
    return _isDarkMode;
  }
}
