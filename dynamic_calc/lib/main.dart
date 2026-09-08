import 'package:flutter/material.dart';
import 'pages/area_calculator_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Area Calculator',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const AreaCalculatorPage(),
    );
  }
}