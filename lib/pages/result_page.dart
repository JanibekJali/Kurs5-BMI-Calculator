import 'package:bmi_calculator/brain/bmi_brain.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_bottom_navigation.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    Key key,
    this.bmiResult,
  }) : super(key: key);
  final double bmiResult;
  // final double bmiResultWeight;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff090E21),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 27.0),
          child: Text(
            'Жыйынтык'.toUpperCase(),
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Color(0xff090E21),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.65,
          width: MediaQuery.of(context).size.width * 0.9,
          color: Color(0xff1D1E33),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                bmiBrain.getResult(bmiResult),
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff34B270),
                ),
              ),
              Text(
                bmiResult.toStringAsFixed(1),
                style: TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold),
              ),
              Text(bmiBrain.getInterpretation(bmiResult)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavgation(
          text: 'Кайра эсепте',
          onTap: () {
            Navigator.pop(context);
          }),
    );
  }
}
