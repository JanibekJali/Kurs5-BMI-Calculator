import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomWidget extends StatelessWidget {
  CustomWidget({this.widget, this.color});
  // final IconData icons;
  // final String text;
  final Widget widget;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        // padding: EdgeInsets.symmetric(vertical: 45.0, horizontal: 50.0),
        height: 200.0,
        width: 200.0,
        child: widget,
      ),
    );
  }
}
