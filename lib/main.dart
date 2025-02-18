import 'package:flutter/material.dart';

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
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String input = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Placeholder"),
          createButton("1", Colors.yellow)
        ],
      ),
    );
  }
}

Widget createButton(String buttonText, Color colour) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: colour),
      onPressed: () {
        print(buttonText);
      }, 
      child: Text(buttonText)
    );
}