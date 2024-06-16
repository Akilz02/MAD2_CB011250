import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.brown.shade200,
    primary: Colors.brown.shade400,
    secondary: Colors.brown.shade200,
    secondaryContainer: Colors.brown.shade50,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.black54,
    secondary: Colors.grey.shade700,
    secondaryContainer: Colors.grey.shade800,
  ),
);