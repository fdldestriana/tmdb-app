import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}
