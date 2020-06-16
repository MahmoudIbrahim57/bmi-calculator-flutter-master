import 'package:flutter/material.dart';
import '../pages/InputPage.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
        primaryColorLight: Colors.white,
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.red)
        )
       ),

      home: InputPage(),
    );
  }
}
