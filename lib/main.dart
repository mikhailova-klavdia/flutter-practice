import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Text("Calculator", style: TextStyle(fontSize: 42)),
            Calculator(),
          ],
        ),
      ),
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
    return Column(
      children: [
        Text("placeholder"),
      ],
    );
  }

}
