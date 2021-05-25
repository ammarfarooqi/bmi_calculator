import 'package:flutter/cupertino.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.color, this.childProperty, this.onTap});
  final Color color;
  final Widget childProperty;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        child: childProperty,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
