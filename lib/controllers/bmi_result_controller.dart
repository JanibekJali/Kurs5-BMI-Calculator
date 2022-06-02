import 'package:bmi_calculator/app_data/repos/app_repo.dart';
import 'package:bmi_calculator/controllers/bmi_page_controllers.dart';
import 'package:get/get.dart';

class BmiResultController extends GetxController {
  final BmiPageControllers _bmiPageControllers = Get.find<BmiPageControllers>();
  @override
  void onInit() {
    calculateBmi();
    getResult();
    getInterpretation();
    super.onInit();
  }

  RxDouble result = 0.0.obs;
  RxString title = 'No results'.obs;
  RxString description = ' You haven\'t chosen anything! '.obs;

  void calculateBmi() {
    result.value = appRepos.calculateBmi(
      _bmiPageControllers.getWeight.value,
      _bmiPageControllers.getHeight.value,
    );
  }

  void getResult() {
    title.value = appRepos.getResult(result.value);
  }

  void getInterpretation() {
    description.value = appRepos.getInterpretation(result.value);
  }
}
