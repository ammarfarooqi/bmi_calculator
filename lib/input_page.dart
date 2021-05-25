import 'package:bmi_calculator/InputPageContents/botton_button.dart';
import 'package:bmi_calculator/InputPageContents/calculator_brain.dart';
import 'package:bmi_calculator/InputPageContents/icon_column.dart';
import 'package:bmi_calculator/InputPageContents/reusable_card.dart';
import 'package:bmi_calculator/InputPageContents/round_icon.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color femaleCardColor = kInactive_card;
  Color maleCardColor = kInactive_card;
  int height = 160;
  int weight = 40;
  int age = 10;
  void updateColor(Gender selection) {
    print("update in progress");
    print(selection);
    if (selection == Gender.male) {
      if (maleCardColor == kInactive_card) {
        maleCardColor = kActive_card;
        femaleCardColor = kInactive_card;
        print("updated");
      }
    } else if (selection == Gender.female) {
      if (femaleCardColor == kInactive_card) {
        femaleCardColor = kActive_card;
        maleCardColor = kInactive_card;
        print("updated");
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                    onTap: () => {
                      setState(() => {updateColor(Gender.male)})
                    },
                    childProperty: IconColumn(
                      icon: Icon(FontAwesomeIcons.mars, size: 80.0),
                      text: Text(
                        "MALE",
                        style: kLabelTextStyle,
                      ),
                    ),
                    color: maleCardColor,
                  )),
                  Expanded(
                    child: ReusableCard(
                      onTap: () => {
                        setState(() => {updateColor(Gender.female)})
                      },
                      childProperty: IconColumn(
                        icon: Icon(FontAwesomeIcons.venus, size: 80.0),
                        text: Text(
                          "FEMALE",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      color: femaleCardColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ReusableCard(
              color: kInactive_card,
              childProperty: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: kSliderButton,
                        inactiveTrackColor: kInactiveSlider,
                        trackHeight: 1,
                        activeTrackColor: kActiveSlider,
                        overlayColor: kSliderButton.withOpacity(0.2),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 270,
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                    color: kInactive_card,
                    childProperty: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icon(FontAwesomeIcons.minus),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: Icon(FontAwesomeIcons.plus),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
                  Expanded(
                      child: ReusableCard(
                    color: kInactive_card,
                    childProperty: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icon(FontAwesomeIcons.minus),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: Icon(FontAwesomeIcons.plus),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            BottonButton(
              text: "Calculate",
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Results(
                              bmiResult: calc.calculateBMI(),
                              interpretation: calc.getInterpretation(),
                              resultText: calc.getResult(),
                            )));
              },
            )
          ],
        ),
      ),
    );
  }
}
