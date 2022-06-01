import 'package:bmi_calculator/app_data/repos/app_repo.dart';
import 'package:bmi_calculator/constants/colors/app_color.dart';
import 'package:bmi_calculator/constants/texts/app_text.dart';
import 'package:bmi_calculator/controllers/bmi_page_controller.dart';
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

class BmiPage extends StatelessWidget {
  BmiPage({Key key}) : super(key: key);

  final BmiPageControler _bmiPageControler =
      Get.put<BmiPageControler>(BmiPageControler());

  Color _activeColor = AppColors.active;

  Color _inactiveColor = AppColors.inActive;

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
                    Obx(() => CustomWidget(
                          color: _bmiPageControler.gender.value == Gender.Male
                              ? _activeColor
                              : _inactiveColor,
                          widget: GenderWidget(
                            icons: FontAwesomeIcons.mars,
                            text: AppTexts.male.toUpperCase(),
                            onTap: () =>
                                _bmiPageControler.gender.value = Gender.Male,
                          ),
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Obx(() => CustomWidget(
                          color: _bmiPageControler.gender.value == Gender.Female
                              ? _activeColor
                              : _inactiveColor,
                          widget: GenderWidget(
                            onTap: () =>
                                _bmiPageControler.gender.value = Gender.Female,
                            icons: FontAwesomeIcons.venus,
                            text: AppTexts.female.toUpperCase(),
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Obx(() => CustomWidget(
                    color: AppColors.main,
                    widget: HeightWidget(
                      currentValue: _bmiPageControler.getHeight.value.toInt(),
                      onChangedSlider: (double koldonuuchuOzgorttu) {
                        _bmiPageControler.setHeight =
                            koldonuuchuOzgorttu.toInt();
                      },
                    ),
                  )),
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
                          numberText: _bmiPageControler.getWeight.value
                              .toInt()
                              .toString(),
                          remove: FontAwesomeIcons.minus,
                          add: FontAwesomeIcons.plus,
                          decrement: () => _bmiPageControler.decrementWeight(),
                          increment: () {
                            _bmiPageControler.incrementWeight();
                          },
                        )),
                    color: AppColors.main,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  CustomWidget(
                    widget: Obx(() => CircleButton(
                          text: AppTexts.age,
                          numberText: _bmiPageControler.getAge.value.toString(),
                          remove: FontAwesomeIcons.minus,
                          add: FontAwesomeIcons.plus,
                          decrement: () {
                            _bmiPageControler.decrementAge();
                          },
                          increment: () {
                            _bmiPageControler.incrementAge();
                          },
                        )),
                    color: AppColors.main,
                  )
                ],
              )),
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
                    bmiResult: appRepos.calculateBmi(
                      _bmiPageControler.getWeight.value,
                      _bmiPageControler.getHeight.value,
                    ),
                  ),
                ));
          },
        ));
  }
}
