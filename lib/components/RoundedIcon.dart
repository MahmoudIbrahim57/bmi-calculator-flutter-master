import 'package:flutter/material.dart';
class RoundedIcon extends StatelessWidget {
  final IconData iconChild;
  final Function iconAction;
  RoundedIcon({@required this.iconChild,@required this.iconAction });
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconChild),
      onPressed: iconAction,
      constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0
      ),
      shape: CircleBorder(),
      elevation: 6.0,
      fillColor: Color(0xFF4C4F5E),
    );
  }
}