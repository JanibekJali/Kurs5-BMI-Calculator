import 'package:bmi_calculator/pages/bmi_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
      ),
      home: BmiPage(),
    );
  }
}
