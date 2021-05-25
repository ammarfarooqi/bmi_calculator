import 'package:flutter/cupertino.dart';

class IconColumn extends StatelessWidget {
  IconColumn({this.icon, this.text});
  final Icon icon;
  final Text text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        SizedBox(
          height: 20,
        ),
        text
      ],
    );
  }
}
