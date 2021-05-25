import 'package:bmi_calculator/InputPageContents/botton_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

import 'InputPageContents/reusable_card.dart';

class Results extends StatelessWidget {
  Results(
      {@required this.interpretation,
      @required this.bmiResult,
      @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Your Result",
                    style: kTitleTextStyle,
                  ),
                ),
              ),
              Expanded(
                  flex: 5,
                  child: ReusableCard(
                    childProperty: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          resultText,
                          style: kResultLabelTextStyle,
                        ),
                        Text(
                          bmiResult,
                          style: kResultTitleTextStyle,
                        ),
                        Text(
                          interpretation,
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    color: kActive_card,
                  )),
              BottonButton(
                text: "RE-CALCULATE",
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
