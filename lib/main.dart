import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      home: Calculator()
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String input = "";
  String result = "0";

  void onButtonClick(String value) {
    setState(() {
      if (value == "C") {
        input = "";
        result = "0";
      } else if (value == "=") {
        result = evaluateExpression(input);
      } else {
        input += value;
      }
    });
  }

  String evaluateExpression(String expression) {
    try {
      ShuntingYardParser p = ShuntingYardParser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      return eval.toString();
    } catch (e) {
      return "Error";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Colors.black38,
        centerTitle: true,
      ),
      
      body: Column(
        children: [
          CalculatorButtons(onButtonClick: onButtonClick),
        ],
      ),
    );
  }
}

class CalculatorButtons extends StatelessWidget {
  final Function(String) onButtonClick;
  const CalculatorButtons({super.key, required this.onButtonClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            createButton("C", const Color.fromARGB(255, 221, 152, 152)),
            createButton("/", Colors.white10),
            createButton("*", Colors.white10),
            createButton("-", Colors.white10)
          ],
        ),
        // for space between rows 
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            createButton("7", Colors.white24),
            createButton("8", Colors.white24),
            createButton("9", Colors.white24),
            createButton("+", Colors.white10)
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            createButton("4", Colors.white24),
            createButton("5", Colors.white24),
            createButton("6", Colors.white24),
            createButton("=", Colors.white10)
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            createButton("1", Colors.white24),
            createButton("2", Colors.white24),
            createButton("3", Colors.white24),
            SizedBox(width: 100.0,),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width: 100.0,),
            createButton("0", Colors.white24),
            SizedBox(width: 100.0,),
            SizedBox(width: 100.0,)
          ],
        )
      ],
    );
  }


  Widget createButton(String buttonText, Color colour) {
    return SizedBox(
      width: 100.0,
      height: 100.0,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: colour,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            ),
          onPressed: () => onButtonClick(buttonText),
          child: Text(buttonText, style: TextStyle(fontSize: 40, color: Colors.white),)
        ),
    );
  } 

}