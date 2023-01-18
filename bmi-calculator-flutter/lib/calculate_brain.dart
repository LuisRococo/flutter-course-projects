import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weigth});

  final height;
  final weigth;

  double _bmi;

  String calculateBMI() {
    _bmi = weigth / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweigth';
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Anim aute ullamco Lorem et quis quis nostrud esse nulla.';
    } else if (_bmi > 18.5) {
      return "Aute nulla pariatur voluptate incididunt.";
    } else {
      return "Nostrud quis veniam irure pariatur anim non.";
    }
  }
}
