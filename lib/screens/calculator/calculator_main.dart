import '../../widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'calculator_buttons.dart';
import 'history.dart';

class CalculatorMain extends StatefulWidget {
  const CalculatorMain({Key? key}) : super(key: key);

  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<CalculatorMain> {
  bool isNewEquation = true;
  List<double> values = [];
  List<String> operations = [];
  List<String> calculations = [];
  String calculatorString = '';

  Widget numberDisplay(String value) => Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Row(
            children: [
              Text(
                value,
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.blue[700],
        //shape: ShapeBorder,
        // backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.green,
        elevation: 50.0,
        toolbarOpacity: 0.8,
        excludeHeaderSemantics: true,

        title: const Text('الة حاسبه'),
        centerTitle: true,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_rounded),
        //   onPressed: () {
        //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => TabsScreen(null)));
        //   },
        // ),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => _navigateAndDisplayHistory(context),
          ),
        ],
      ),
      body: Column(
        children: [
          numberDisplay(calculatorString),
          CalculatorButtons(onTap: _onPressed),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      drawer: const MainDrawer(),
    );
  }

  _navigateAndDisplayHistory(BuildContext context) async {
    // final result = navigateTo(context, History(operations: calculations));
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => History(operations: calculations)),
    );

    if (result != null) {
      setState(() {
        isNewEquation = false;
        calculatorString = Calculator.parseString(result);
      });
    }
  }

  void _onPressed({String? buttonText}) {
    if (Calculations.operations.contains(buttonText)) {
      return setState(() {
        operations.add(buttonText!);
        calculatorString += ' $buttonText ';
      });
    }

    // On CLEAR press
    if (buttonText == Calculations.clear) {
      return setState(() {
        operations.add(Calculations.clear);
        calculatorString = '';
      });
    }

    // On Equals press
    if (buttonText == Calculations.equal) {
      String newCalculatorString = Calculator.parseString(calculatorString);

      return setState(() {
        if (newCalculatorString != calculatorString) {
          // only add evaluated strings to calculations array
          calculations.add(calculatorString);
        }

        operations.add(Calculations.equal);
        calculatorString = newCalculatorString;
        isNewEquation = false;
      });
    }

    if (buttonText == Calculations.period) {
      return setState(() {
        calculatorString = Calculator.addPeriod(calculatorString);
      });
    }

    setState(() {
      if (!isNewEquation &&
          operations.isNotEmpty &&
          operations.last == Calculations.equal) {
        calculatorString = buttonText!;
        isNewEquation = true;
      } else {
        calculatorString += buttonText!;
      }
    });
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
