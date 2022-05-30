import 'dart:math' as math;

class AppServices {
  num _bmi;

  double calculateBmi(int _weight, int _height) {
    _bmi = _weight / math.pow(_height / 100, 2);
    return _bmi;
  }

  String getResult(double _bmi) {
    if (_bmi >= 25) {
      return 'Салмагыныз ашыкча';
    } else if (_bmi > 18.5) {
      return 'Нормалдуу';
    } else {
      return 'Кобураак жениз';
    }
  }

  String getInterpretation(double _bmi) {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}

final AppServices appServices = AppServices();
