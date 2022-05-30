import 'package:bmi_calculator/app_data/repos/app_repo.dart';
import 'package:bmi_calculator/constants/colors/app_color.dart';
import 'package:bmi_calculator/constants/texts/app_text.dart';
import 'package:bmi_calculator/pages/result_page.dart';
import 'package:bmi_calculator/widgets/height_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../app_data/enums/app_enum.dart';
import '../widgets/circle_button.dart';
import '../widgets/custom_bottom_navigation.dart';
import '../widgets/custom_widget.dart';
import '../widgets/gender_widget.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({Key key}) : super(key: key);

  @override
  _BmiPageState createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  int _height = 170;
  int _weight = 60;
  int _age = 23;

  Color _activeColor = AppColors.active;
  Color _inactiveColor = AppColors.inActive;

  Gender _gender = Gender.None;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppTexts.bmiCalculator),
          backgroundColor: AppColors.appBar,
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
                      color: _gender == Gender.Male
                          ? _activeColor
                          : _inactiveColor,
                      widget: GenderWidget(
                        icons: FontAwesomeIcons.mars,
                        text: AppTexts.male.toUpperCase(),
                        onTap: () {
                          setState(() {
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
                            _gender = Gender.Female;
                          });
                        },
                        icons: FontAwesomeIcons.venus,
                        text: AppTexts.female.toUpperCase(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomWidget(
                color: AppColors.main,
                widget: HeightWidget(
                  currentValue: _height.toInt(),
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
                        text: AppTexts.weight.toUpperCase(),
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
                      color: AppColors.main,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    CustomWidget(
                      widget: CircleButton(
                        text: AppTexts.age,
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
                      color: AppColors.main,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavgation(
          text: AppTexts.calcullate,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: appRepos.calculateBmi(_weight, _height),
                  ),
                ));
          },
        ));
  }
}
