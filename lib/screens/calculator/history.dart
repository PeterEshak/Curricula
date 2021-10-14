import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({Key? key, this.operations}) : super(key: key);

  final List<String>? operations;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever_outlined),
            onPressed: () {
              operations!.removeLast();
              //operations!.remove(context);
            },
          )
        ],
      ),
      body: Center(
        child: _operationsList(operations!),
      ),
    );
  }

  Widget _operationsList(List<String> operations) {
    return ListView.builder(
      itemCount: operations.length,
      itemBuilder: (BuildContext context, int i) {
        return ListTile(
          title: Text(operations[i]),
          onTap: () {
            Navigator.pop(context, operations[i]);
          },
          leading: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red[800]!, width: 2.0),
              borderRadius: BorderRadius.circular(50)
            ),
            child: Text(
              Calculator.parseString(operations[i]),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            padding: const EdgeInsets.all(5),
          ),
        );
      },
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
class Calculator {
  static String parseString(String text) {
    List<String> numbersToAdd;
    double a, b, result;
    if (text.contains(Calculations.add)) {
      numbersToAdd = text.split(Calculations.add);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);

      result = Calculations.addOpe(a, b);
    } else if (text.contains(Calculations.multiply)) {
      numbersToAdd = text.split(Calculations.multiply);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);

      result = Calculations.multiplyOpe(a, b);
    } else if (text.contains(Calculations.divide)) {
      numbersToAdd = text.split(Calculations.divide);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);

      result = Calculations.divideOpe(a, b);
    } else if (text.contains(Calculations.subtract)) {
      numbersToAdd = text.split(Calculations.subtract);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);

      result = Calculations.subtractOpe(a, b);
    } else {
      return text;
    }

    return NumberFormatter.format(result.toString());
  }

  static String addPeriod(String calculatorString) {
    if (calculatorString.isEmpty) {
      return calculatorString = '0${Calculations.period}';
    }

    RegExp exp = RegExp(r'\d\.');
    Iterable<Match> matches = exp.allMatches(calculatorString);
    int maxMatches = Calculator.includesOperation(calculatorString) ? 2 : 1;

    return matches.length == maxMatches
        ? calculatorString
        : calculatorString += Calculations.period;
  }

  static bool includesOperation(String calculatorString) {
    for (var operation in Calculations.operations) {
      if (calculatorString.contains(operation)) {
        return true;
      }
    }

    return false;
  }
}

class NumberFormatter {
  static String format(String text) {
    try {
      double parsedNumber = double.parse(text);
      if ((parsedNumber != double.infinity) &&
          (parsedNumber == parsedNumber.floor())) {
        return parsedNumber.truncate().toString();
      }

      return text;
    } catch (err) {
      return text;
    }
  }
}
