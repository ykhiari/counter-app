import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
      brightness: Brightness.light,
      backgroundColor: Colors.yellow.shade100,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo.shade600));
  static final darkTheme = ThemeData(
      brightness: Brightness.dark,
      backgroundColor: Colors.black54,
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: Colors.red.shade900));
}
