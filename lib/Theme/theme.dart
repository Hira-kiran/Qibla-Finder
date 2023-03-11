import 'package:flutter/material.dart';

class ThemeClass {
  static final darkTheme = ThemeData(
scaffoldBackgroundColor: Colors.black,
colorScheme: ColorScheme.dark()
  );
    static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white, colorScheme: ColorScheme.light());
}
