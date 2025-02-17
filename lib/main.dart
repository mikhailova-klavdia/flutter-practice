import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World ',
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        //appBar: AppBar(title: const Text('Hello World!!!')),
        body: const Center(
          child: Text(
            'Hello, World!',
            style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: Colors.black),
          )
        )
      )
    );
  }
}

