import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.green,
    appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
  );

  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.green,
    appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
  );
}
