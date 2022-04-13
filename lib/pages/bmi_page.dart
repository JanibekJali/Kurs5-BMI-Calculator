import 'package:bmi_calculator/brain/bmi_brain.dart';
import 'package:bmi_calculator/pages/result_page.dart';
import 'package:bmi_calculator/widgets/height_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/circle_button.dart';
import '../widgets/custom_bottom_navigation.dart';
import '../widgets/custom_widget.dart';
import '../widgets/gender_widget.dart';

enum Gender {
  Male,
  Female,
  None,
}

class BmiPage extends StatefulWidget {
  const BmiPage({Key key}) : super(key: key);

  @override
  _BmiPageState createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  int _height = 170;
  int _weight = 60;
  int _age = 23;

  Color _activeColor = Color.fromARGB(255, 43, 47, 82);
  Color _inactiveColor = Color(0xff111327);
  // bool _maleSelected = false;
  // bool _femaleSelected = false;
  Gender _gender = Gender.None;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
          backgroundColor: Color(0xff111327),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
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
                      color: _gender == Gender.Male
                          ? _activeColor
                          : _inactiveColor,
                      widget: GenderWidget(
                        icons: FontAwesomeIcons.mars,
                        text: 'Male',
                        onTap: () {
                          setState(() {
                            // _maleSelected = true;
                            // _maleSelected = !_maleSelected;
                            // _femaleSelected = false;
                            _gender = Gender.Male;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    CustomWidget(
                      color: _gender == Gender.Female
                          ? _activeColor
                          : _inactiveColor,
                      widget: GenderWidget(
                        onTap: () {
                          setState(() {
                            // _femaleSelected = true;
                            // _femaleSelected = !_femaleSelected;
                            // _maleSelected = false;
                            _gender = Gender.Female;
                            // log('_femaleSelected==> $_femaleSelected');
                          });
                        },
                        icons: FontAwesomeIcons.venus,
                        text: 'Female',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomWidget(
                color: Color(0xff111327),
                widget: HeightWidget(
                  currentValue: _height.toInt(),
                  // aty bar funksiya
                  // onChangedSlider: atyBarFunksiya,
                  // aty jok funksiya
                  onChangedSlider: (double koldonuuchuOzgorttu) {
                    setState(() {
                      _height = koldonuuchuOzgorttu.toInt();
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomWidget(
                      widget: CircleButton(
                        text: 'Weight',
                        numberText: _weight.toInt().toString(),
                        remove: FontAwesomeIcons.minus,
                        add: FontAwesomeIcons.plus,
                        decrement: () {
                          setState(() {
                            _weight--;
                          });
                        },
                        increment: () {
                          setState(() {
                            _weight++;
                          });
                        },
                      ),
                      color: Color(0xff111327),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    CustomWidget(
                      widget: CircleButton(
                        text: 'Age',
                        numberText: _age.toString(),
                        remove: FontAwesomeIcons.minus,
                        add: FontAwesomeIcons.plus,
                        decrement: () {
                          setState(() {
                            _age--;
                          });
                        },
                        increment: () {
                          setState(() {
                            _age++;
                          });
                        },
                      ),
                      color: Color(0xff111327),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavgation(
          text: 'Эсепте',
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: bmiBrain.calculateBmi(_weight, _height),
                  ),
                ));
          },
        ));
  }
}

// turnary operator/if-else  === _maleSelected ? _activeColor : _inactiveColor,
// if(_maleSelected){
// _activeColor  
// }else{
// _inactiveColor
// }
