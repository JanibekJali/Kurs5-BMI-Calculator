import 'package:flutter/material.dart';

class CustomBottomNavgation extends StatelessWidget {
  const CustomBottomNavgation({
    this.onTap,
  });
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      color: Color(0xffF50D56),
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: InkWell(
          onTap: onTap,
          child: Text(
            'Calculate'.toUpperCase(),
            style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
