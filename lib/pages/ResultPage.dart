import 'package:bmi_calculator/components/Constants.dart';
import 'package:bmi_calculator/components/ReusableCard.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/pages/InputPage.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.bmiResult,@required this.resultText,@required this.interText});
  final String bmiResult;
  final String  resultText;
  final String  interText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
               child: Text(
                'Your Result',
                style: KyourResultTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    resultText,
                    style: KoverviewTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: KyourResultTextStyle,
                  ),
                  Text(interText
                  ,style: KresultTextStyle,
                  )
                ],

              ),
            ),
          )
        , BottomButton(buttonText: 'RE-CALCULATE',
          action: (){
          Navigator.pop(context);
          },
          )
        ],
      ),
    );
  }
}
