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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              createButton("C", const Color.fromARGB(255, 221, 152, 152)),
              createButton("/", Colors.white10),
              createButton("*", Colors.white10)
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
              createButton("-", Colors.white10)
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              createButton("4", Colors.white24),
              createButton("5", Colors.white24),
              createButton("6", Colors.white24),
              createButton("+", Colors.white10)
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              createButton("1", Colors.white24),
              createButton("2", Colors.white24),
              createButton("3", Colors.white24),
              createButton("=", Colors.white10)
            ],
          ),
          SizedBox(height: 15),
          createButton("0", Colors.white24)
        ],
      ),
    );
  }
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
        onPressed: () {
          print(buttonText);
        }, 
        child: Text(buttonText, style: TextStyle(fontSize: 40, color: Colors.white),)
      ),
  );
}