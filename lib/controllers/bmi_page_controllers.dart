import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../app_data/enums/app_enum.dart';
import '../constants/colors/app_color.dart';

class BmiPageControllers extends GetxController {
  RxInt _height = 170.obs;
  RxInt _weight = 60.obs;
  RxInt _age = 23.obs;

  RxInt get getHeight => _height;
  set setHeight(int value) {
    _height.value = value;
  }

  RxInt get getWeight => _weight;
  set setWeight(int value) {
    _weight.value = value;
  }

  RxInt get getAge => _age;
  set setAge(int value) {
    _age.value = value;
  }

  Rx<Color> activeColor = AppColors.active.obs;
  Rx<Color> inactiveColor = AppColors.inActive.obs;

  Rx<Gender> gender = Gender.None.obs;
  void incrementWeight() {
    _weight++;
  }

  void decrementWeight() {
    _weight--;
  }

  void incrementAge() {
    _age++;
  }

  void decrementAge() {
    _age--;
  }

  void changeGender(Gender chosenGender) {
    gender.value = chosenGender;
  }

  void changeActiveColor(Color chosenColor) {
    activeColor.value = chosenColor;
  }

  void changeInactiveColor(Color chosenColor) {
    inactiveColor.value = chosenColor;
  }
}
