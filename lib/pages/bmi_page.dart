import 'package:bmi_calculator/app_data/repos/app_repo.dart';
import 'package:bmi_calculator/constants/colors/app_color.dart';
import 'package:bmi_calculator/constants/texts/app_text.dart';
import 'package:bmi_calculator/controllers/bmi_page_controllers.dart';
import 'package:bmi_calculator/pages/result_page.dart';
import 'package:bmi_calculator/widgets/height_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
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
  final BmiPageControllers _bmiPageControllers =
      Get.put<BmiPageControllers>(BmiPageControllers());
  // int _height = 170;
  // int _weight = 60;
  // int _age = 23;

  final Color _activeColor = AppColors.active;
  final Color _inactiveColor = AppColors.inActive;

  // Gender _gender = Gender.None;
  @override
  void initState() {
    // _bmiPageControllers.setHeight = 25;
    // _bmiPageControllers.changeGender(Gender.Female);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppTexts.bmiCalculator),
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
                    Obx(
                      () => CustomWidget(
                        color: _bmiPageControllers.gender.value == Gender.Male
                            ? _bmiPageControllers.activeColor.value
                            // AppColors.active
                            : _bmiPageControllers.inactiveColor.value,
                        // AppColors.inactive
                        widget: GenderWidget(
                          icons: FontAwesomeIcons.mars,
                          text: AppTexts.male.toUpperCase(),
                          onTap: () {
                            _bmiPageControllers.changeGender(Gender.Male);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Obx(
                      () => CustomWidget(
                        color: _bmiPageControllers.gender.value == Gender.Female
                            ? _bmiPageControllers.activeColor.value
                            : _bmiPageControllers.inactiveColor.value,
                        widget: GenderWidget(
                          onTap: () {
                            _bmiPageControllers.changeGender(Gender.Female);
                          },
                          icons: FontAwesomeIcons.venus,
                          text: AppTexts.female.toUpperCase(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomWidget(
                color: AppColors.main,
                widget: Obx(() => HeightWidget(
                      currentValue: _bmiPageControllers.getHeight.toInt(),
                      onChangedSlider: (double koldonuuchuOzgorttu) {
                        _bmiPageControllers.setHeight =
                            koldonuuchuOzgorttu.toInt();

                        // setState(() {
                        //   _height = koldonuuchuOzgorttu.toInt();
                        // });
                      },
                    )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomWidget(
                      widget: Obx(() => CircleButton(
                            text: AppTexts.weight.toUpperCase(),
                            numberText:
                                _bmiPageControllers.getWeight.value.toString(),
                            remove: FontAwesomeIcons.minus,
                            add: FontAwesomeIcons.plus,
                            decrement: () =>
                                _bmiPageControllers.decrementWeight(),
                            // setState(() {
                            //   _weight--;
                            // });

                            increment: () =>
                                _bmiPageControllers.incrementWeight()
                            // setState(() {
                            //   _weight++;
                            // });
                            ,
                          )),
                      color: AppColors.main,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    CustomWidget(
                      widget: Obx(() => CircleButton(
                            text: AppTexts.age,
                            numberText:
                                _bmiPageControllers.getAge.value.toString(),
                            remove: FontAwesomeIcons.minus,
                            add: FontAwesomeIcons.plus,
                            decrement: () => _bmiPageControllers.decrementAge(),
                            // setState(() {
                            //   _age--;
                            // });

                            increment: () => _bmiPageControllers.incrementAge(),
                            // setState(() {
                            //   _age++;
                            // });
                          )),
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
                      // bmiResult: appRepos.calculateBmi(
                      //   _bmiPageControllers.getWeight.value,
                      //   _bmiPageControllers.getHeight.value,
                      // ),
                      ),
                ));
          },
        ));
  }
}
