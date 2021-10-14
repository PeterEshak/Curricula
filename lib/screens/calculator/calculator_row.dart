import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef CalculatorButtonTapCallback = void Function({String buttonText});

class CalculatorRow extends StatelessWidget {
  const CalculatorRow({this.text, @required this.buttons, @required this.onTap,Key? key}): super(key: key);

  final String? text;
  final CalculatorButtonTapCallback? onTap;
  final List<String>? buttons;

  Widget calculatorButton(String text, Function onTop) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            borderRadius:BorderRadius.circular(10) ,
            //shape: BoxShape.circle,
          border: Border.all(
            color: const Color.fromRGBO(0, 0, 0, 0.1),
            width: 0.5,
          ),
        ),
        // ignore: deprecated_member_use
        child: FlatButton(
          clipBehavior: Clip.antiAlias,
          shape: Border.all(color: Colors.grey,width: 5,style: BorderStyle.solid),
          color: Colors.blue[300],
          onPressed: () => onTap!(buttonText: text),
          child: Text(
            text,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          padding: const EdgeInsets.all(30),
          highlightColor: Colors.blueGrey[500],
          splashColor: Colors.blueAccent[500],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: rowButtons(),
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }

  List<Widget> rowButtons() {
    List<Widget> rowButtons = [];

    for (var buttonText in buttons!) {
      rowButtons.add(
        calculatorButton(
          buttonText,
          onTap!,
        ),
      );
    }

    return rowButtons;
  }
}
