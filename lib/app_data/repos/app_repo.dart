import 'package:bmi_calculator/app_data/services/app_services.dart';

class AppRepos {
  double calculateBmi(int _weight, int _height) {
    return appServices.calculateBmi(_weight, _height);
  }

  String getResult(double _bmi) {
    return appServices.getResult(_bmi);
  }

  String getInterpretation(double _bmi) {
    return appServices.getInterpretation(_bmi);
  }
}

final AppRepos appRepos = AppRepos();
