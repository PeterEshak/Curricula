import 'package:flutter/material.dart';
import 'calculator_row.dart';

typedef CalculatorButtonTapCallback = void Function({String buttonText});

class CalculatorButtons extends StatelessWidget {
  CalculatorButtons({Key? key, @required this.onTap}) : super(key: key);

  final CalculatorButtonTapCallback? onTap;
  final calculatorButtonRows = [
    ['7', '8', '9', Calculations.divide],
    ['4', '5', '6', Calculations.multiply],
    ['1', '2', '3', Calculations.subtract],
    [Calculations.period, '0', '00', Calculations.add],
    [Calculations.clear, Calculations.equal]
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: calculatorButtonRows.map((calculatorRowButtons) {
        return CalculatorRow(
          buttons: calculatorRowButtons,
          onTap: onTap,
        );
      }).toList()
    );
  }
}
class Calculations {
  static const period = '.';
  static const multiply = '*';
  static const subtract = '-';
  static const add = '+';
  static const divide = '/';
  static const clear = 'CLEAR';
  static const equal = '=';
  static const operations = [
    Calculations.add,
    Calculations.multiply,
    Calculations.subtract,
    Calculations.divide,
  ];

  static double addOpe(double a, double b) => a + b;

  static double subtractOpe(double a, double b) => a - b;

  static double divideOpe(double a, double b) => a / b;

  static double multiplyOpe(double a, double b) => a * b;
}
