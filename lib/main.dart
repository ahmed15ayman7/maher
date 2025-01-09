import 'package:flutter/material.dart';
import 'package:maher/screens/motorcycle_screen.dart';
import 'package:maher/screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MotorcycleScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
