import 'dart:ui';

import 'package:bmi_calculator/widgets/height_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/circle_button.dart';
import '../widgets/custom_widget.dart';
import '../widgets/gender_widget.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  int _currentValue = 170;
  // void atyBarFunksiya(double koldonuuchuOzgorttu) {
  //   setState(() {
  //     _currentValue = koldonuuchuOzgorttu;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomWidget(
                    // icons: FontAwesomeIcons.mars,
                    // text: 'Male',
                    color: Color(0xff111327),
                    widget: GenderWidget(
                      icons: FontAwesomeIcons.mars,
                      text: 'Male',
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  CustomWidget(
                    color: Color(0xff111327),
                    widget: GenderWidget(
                      icons: FontAwesomeIcons.venus,
                      text: 'Female',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            CustomWidget(
              color: Color(0xff111327),
              widget: HeightWidget(
                currentValue: _currentValue,
                // aty bar funksiya
                // onChangedSlider: atyBarFunksiya,
                // aty jok funksiya
                onChangedSlider: (double koldonuuchuOzgorttu) {
                  setState(() {
                    _currentValue = koldonuuchuOzgorttu.toInt();
                  });
                },
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomWidget(
                    color: Color(0xff111327),
                    widget: CircleButton(),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  CustomWidget(
                    color: Color(0xff111327),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
