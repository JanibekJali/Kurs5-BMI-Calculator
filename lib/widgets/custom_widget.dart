import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  CustomWidget({this.widget, this.color});

  final Widget widget;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 20.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: widget,
      ),
    );
  }
}
