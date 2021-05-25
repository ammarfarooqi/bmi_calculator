import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';

class BottonButton extends StatelessWidget {
  BottonButton({@required this.text, this.onTap});
  final String text;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: kLargeButton,
          ),
        ),
        color: kBottonContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
