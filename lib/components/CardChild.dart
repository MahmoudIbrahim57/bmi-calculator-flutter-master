import 'package:bmi_calculator/components/Constants.dart';
import 'package:flutter/material.dart';
class CardChild extends StatelessWidget {

  final String label;
  final IconData childICon;

  CardChild({this.childICon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          childICon
          , size: 80.0,),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: textStyle,
        )

      ],
    );
  }
}

