import 'package:flutter_calculator/numbers_enum.dart';
import 'package:flutter_calculator/operators_enum.dart';

class CalculatorButtonHelper {

  static CalculatorNumber getNumberEnum(String calculatorNumberValue) {
    switch(calculatorNumberValue) {
      case "0":
        return CalculatorNumber.zero;
      case "1":
        return CalculatorNumber.one;
      case "2":
        return CalculatorNumber.two;
      case "3":
        return CalculatorNumber.three;
      case "4":
        return CalculatorNumber.four;
      case "5":
        return CalculatorNumber.five;
      case "6":
        return CalculatorNumber.six;
      case "7":
        return CalculatorNumber.seven;
      case "8":
        return CalculatorNumber.eight;
      case "9":
        return CalculatorNumber.nine;
      default:
        return null;
    }
  }

  static String getNumberValue(CalculatorNumber calculatorNumberEnum) {
    switch(calculatorNumberEnum) {
      case CalculatorNumber.zero:
        return "0";
      case CalculatorNumber.one:
        return "1";
      case CalculatorNumber.two:
        return "2";
      case CalculatorNumber.three:
        return "3";
      case CalculatorNumber.four:
        return "4";
      case CalculatorNumber.five:
        return "5";
      case CalculatorNumber.six:
        return "6";
      case CalculatorNumber.seven:
        return "7";
      case CalculatorNumber.eight:
        return "8";
      case CalculatorNumber.nine:
        return "9";
      default:
        return "-1";
    }
  }

  static CalculatorOperator getOperatorEnum(String calculatorOperatorValue) {
    switch(calculatorOperatorValue) {
      case "CLEAR": 
        return CalculatorOperator.clear;
      case "+": 
        return CalculatorOperator.plus;
      case "-": 
        return CalculatorOperator.minus;  
      case "/": 
        return CalculatorOperator.divide;  
      case "X": 
        return CalculatorOperator.multiply;  
      case "=": 
        return CalculatorOperator.equal;  
      case ".": 
        return CalculatorOperator.dot;
      default:
        return null;
    }
  }

  static String getOperatorValue(CalculatorOperator calculatorOperatorEnum){
    switch(calculatorOperatorEnum) {
      case CalculatorOperator.clear: 
        return "CLEAR";
      case CalculatorOperator.plus: 
        return "+";
      case CalculatorOperator.minus: 
        return "-";  
      case CalculatorOperator.divide: 
        return "/";  
      case CalculatorOperator.multiply: 
        return "X";  
      case CalculatorOperator.equal: 
        return "=";  
      case CalculatorOperator.dot: 
        return ".";  
      default:
        return "";
    }
  }
} 