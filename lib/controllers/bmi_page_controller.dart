import 'package:get/get.dart';

import '../app_data/enums/app_enum.dart';

class BmiPageControler extends GetxController {
  RxInt _height = 170.obs;
  RxInt _weight = 60.obs;
  RxInt _age = 23.obs;

  Rx<Gender> gender = Gender.None.obs;
  // get set
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
}
