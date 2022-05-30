import 'dart:math' as math;

class BmiBrain {
  num _bmi;

  double calculateBmi(int _weight, int _height) {
    // weight (lb) / [height (in)]2 x 703.
    // final w = _weight * 2.205;
    // final h = (_height * 2.54) * 2;
    // final _bmi = w / h * 703;

    _bmi = _weight / math.pow(_height / 100, 2);
    return _bmi;
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

BmiBrain bmiBrain = BmiBrain();
