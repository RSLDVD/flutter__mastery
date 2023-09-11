// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    splashColor: Colors.grey,
    primaryColor: const Color(0xFFeef1f6),//Color(0xFFeef1f6),
    bottomAppBarColor: const Color(0xFFD71313),
    hintColor: const Color(0xFF555a54),
    scaffoldBackgroundColor: const Color(0xffF7FFE5),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontFamily: 'OpenSansCondensed', 
        fontWeight: FontWeight.normal, 
        color:  Color(0xFF1D5B79),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: const Color(0xFFeef1f6),//Color(0xffeeeeee),
      iconTheme: IconThemeData(
        color: Color(0xff022C43),
      ),
      titleTextStyle: TextStyle(
        fontFamily: 'OpenSansCondensed', 
        fontWeight: FontWeight.bold,
        color: Color(0xff022C43),
      ),
    ),
    drawerTheme: const DrawerThemeData(
        backgroundColor: Color(0xFFF3FDE8), scrimColor: Colors.white38),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    splashColor: Colors.white30,
    primaryColor: const Color(0xff000000),
    bottomAppBarColor: const Color(0xFFD71313),
    hintColor: const Color(0xff222222),
    scaffoldBackgroundColor: const Color(0xff181818),//Color(0xff323232),
    textTheme:
        const TextTheme(
      titleMedium: TextStyle(
        fontFamily: 'OpenSansCondensed', 
        fontWeight: FontWeight.normal, 
        color: Color(0xffEADBC8),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor:Color(0xff000000),// Color(0xff1B262C),
      iconTheme: IconThemeData(
        color: Color(0xffF5EDCE),
      ),
      titleTextStyle: TextStyle(
        fontFamily: 'OpenSansCondensed', 
        fontWeight: FontWeight.bold,
        color: Color(0xffF5EDCE),
      ),
    ),
    drawerTheme: const DrawerThemeData(
        backgroundColor: const Color(0xff181818), scrimColor: Colors.black38),
  );
}
