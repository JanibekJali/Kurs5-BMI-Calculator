import 'package:bmi_calculator/pages/bmi_page.dart';
import 'package:bmi_calculator/utils/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BmiApp());
}

class BmiApp extends StatelessWidget {
  const BmiApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bmi Calculator',
      theme: AppTheme.darkTheme,
      home: BmiPage(),
    );
  }
}
