import 'dart:ffi';

import 'package:bmi_calculator/components/CardChild.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/CardChild.dart';
import '../components/ReusableCard.dart';
import '../components/Constants.dart';
import '../components/RoundedIcon.dart';
import 'ResultPage.dart';
import 'Calculate.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int sliderValue = 170;
  int height = 170;
  int weight = 65;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        color: selectedGender == Gender.male
                            ? activeCardColor
                            : inActiveCardColor,
                        cardChild: CardChild(
                          childICon: FontAwesomeIcons.mars,
                          label: 'Male',
                        ),
                      ),
                    ),
                    Expanded(
                        child: ReusableCard(
                          onPress: () {
                            setState(() {
                              selectedGender = Gender.female;
                            });
                          },
                          color: selectedGender == Gender.female
                              ? activeCardColor
                              : inActiveCardColor,
                          cardChild: CardChild(
                              childICon: FontAwesomeIcons.venus,
                              label: 'Female'),
                        ))
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: ReusableCard(
                          color: inActiveCardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Height",
                                style: textStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text(
                                    sliderValue.toString(),
                                    style: textStyle,
                                  ),
                                  Text(
                                    "cm",
                                    style: KsmallTextStyle,
                                  )
                                ],
                              ),
                              SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                    overlayColor: Color(0x29EB1555),
                                    activeTickMarkColor: Colors.white,
                                    thumbColor: Color(0xFFEB1555),
                                    inactiveTrackColor: Color(0xFF8D8E98),
                                    thumbShape:
                                    RoundSliderThumbShape(
                                        enabledThumbRadius: 15.0),
                                    overlayShape:
                                    RoundSliderOverlayShape(
                                        overlayRadius: 30.0)),
                                child: Slider(
                                  value: sliderValue.toDouble(),
                                  min: 120.0,
                                  max: 220.0,
                                  onChanged: (double newValue) {
                                    setState(() {
                                      sliderValue = newValue.round();
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: new ReusableCard(
                          color: inActiveCardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Weight',
                                style: textStyle,
                              ),
                              Text(
                                weight.toString(),
                                style: textStyle,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RoundedIcon(
                                      iconChild: FontAwesomeIcons.minus,
                                      iconAction: () {
                                        setState(() {
                                          weight--;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    RoundedIcon(
                                      iconChild: FontAwesomeIcons.plus,
                                      iconAction: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                    ),
                                  ])
                            ],
                          ),
                        )),
                    Expanded(
                        child: new ReusableCard(
                          color: inActiveCardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Age',
                                style: textStyle,
                              ),
                              Text(
                                age.toString(),
                                style: textStyle,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RoundedIcon(
                                      iconChild: FontAwesomeIcons.minus,
                                      iconAction: () {
                                        setState(() {
                                          age--;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    RoundedIcon(
                                      iconChild: FontAwesomeIcons.plus,
                                      iconAction: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                    )
                                  ])
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              BottomButton(
                buttonText: 'CALCULATE',
                action: () {
                  Calculate cal = Calculate(
                      height: sliderValue, weight: weight);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ResultPage(
                                bmiResult: cal.calculateBMI(),
                                interText: cal.getResult(),
                                resultText: cal.getInterpretation(),
                              )));
                },
              )
            ],
          ),
        ));
  }
}

class BottomButton extends StatelessWidget {
  final Function action;
  final String buttonText;

  BottomButton({this.buttonText, this.action});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        child: Center(
          child: Text(
            buttonText,
            style: textStyle,
          ),
        ),
        color: bottomCardColor,
        width: double.infinity,
        height: bottomCardHeight,
        margin: EdgeInsets.only(top: 10.0),
      ),
    );
  }
}
