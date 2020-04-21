import 'package:flutter/material.dart';
import 'package:flutter_calculator/numbers_enum.dart';
import 'package:flutter_calculator/operators_enum.dart';
import 'package:flutter_calculator/utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(title: 'Flutter Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String _output = "0";

  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttontext) {
    CalculatorOperator value =
        CalculatorButtonHelper.getOperatorEnum(buttontext);

    switch (value) {
      case CalculatorOperator.clear:
        _output = "0";
        num1 = 0.0;
        num2 = 0.0;
        operand = "";
        break;
      case CalculatorOperator.plus:
      case CalculatorOperator.minus:
      case CalculatorOperator.divide:
      case CalculatorOperator.multiply:
        num1 = double.parse(output);
        operand = buttontext;
        _output = "0";
        break;
      case CalculatorOperator.equal:
        num2 = double.parse(output);
        CalculatorOperator operator =
            CalculatorButtonHelper.getOperatorEnum(operand);
        switch (operator) {
          case CalculatorOperator.plus:
            _output = (num1 + num2).toString();
            break;
          case CalculatorOperator.minus:
            _output = (num1 - num2).toString();
            break;
          case CalculatorOperator.multiply:
            _output = (num1 * num2).toString();
            break;
          case CalculatorOperator.divide:
            _output = (num1 / num2).toString();
            break;
          default:
            break;
        }

        num1 = 0.0;
        num2 = 0.0;
        operand = "";

        break;
      case CalculatorOperator.dot:
        if (_output.contains(
            CalculatorButtonHelper.getOperatorValue(CalculatorOperator.dot))) {
          print("Already contains decimal");
          return;
        }

        _output = _output + buttontext;
        break;
      default:
        int index = _output.indexOf(
            CalculatorButtonHelper.getOperatorValue(CalculatorOperator.dot));
        if (index == -1) {
          _output = _output + buttontext;
        } else {
          String before = _output.substring(0, index);
          String after = _output.substring(index);
          _output = before + buttontext + after;
        }
        break;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttontext) {
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(24.0),
        child: new Text(
          buttontext,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => buttonPressed(buttontext),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              new Container(
                  alignment: Alignment.centerRight,
                  padding: new EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 12.0),
                  child: new Text(
                    output,
                    style:
                        TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
                  )),
              new Expanded(
                child: new Divider(),
              ),
              new Column(
                children: [
                  new Row(children: [
                    buildButton(CalculatorButtonHelper.getNumberValue(
                        CalculatorNumber.seven)),
                    buildButton(CalculatorButtonHelper.getNumberValue(
                        CalculatorNumber.eight)),
                    buildButton(CalculatorButtonHelper.getNumberValue(
                        CalculatorNumber.nine)),
                    buildButton(CalculatorButtonHelper.getOperatorValue(
                        CalculatorOperator.divide)),
                  ]),
                  new Row(children: [
                    buildButton(CalculatorButtonHelper.getNumberValue(
                        CalculatorNumber.four)),
                    buildButton(CalculatorButtonHelper.getNumberValue(
                        CalculatorNumber.five)),
                    buildButton(CalculatorButtonHelper.getNumberValue(
                        CalculatorNumber.six)),
                    buildButton(CalculatorButtonHelper.getOperatorValue(
                        CalculatorOperator.multiply)),
                  ]),
                  new Row(children: [
                    buildButton(CalculatorButtonHelper.getNumberValue(
                        CalculatorNumber.one)),
                    buildButton(CalculatorButtonHelper.getNumberValue(
                        CalculatorNumber.two)),
                    buildButton(CalculatorButtonHelper.getNumberValue(
                        CalculatorNumber.three)),
                    buildButton(CalculatorButtonHelper.getOperatorValue(
                        CalculatorOperator.minus)),
                  ]),
                  new Row(children: [
                    buildButton(CalculatorButtonHelper.getOperatorValue(
                        CalculatorOperator.dot)),
                    buildButton(CalculatorButtonHelper.getNumberValue(
                        CalculatorNumber.zero)),
                    buildButton("00"),
                    buildButton(CalculatorButtonHelper.getOperatorValue(
                        CalculatorOperator.plus)),
                  ]),
                  new Row(children: [
                    buildButton(CalculatorButtonHelper.getOperatorValue(
                        CalculatorOperator.clear)),
                    buildButton(CalculatorButtonHelper.getOperatorValue(
                        CalculatorOperator.equal)),
                  ]),
                ],
              )
            ],
          ),
        ));
  }
}
