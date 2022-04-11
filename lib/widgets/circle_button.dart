import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    this.text,
    this.numberText,
    this.remove,
    this.add,
    @required this.decrement,
    @required this.increment,
  });
  final String text;
  final String numberText;
  final IconData remove;
  final IconData add;
  final void Function() decrement;
  final void Function() increment;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text.toUpperCase(),
          style: TextStyle(fontSize: 25.0, color: Color(0xff5A5B6B)),
        ),
        Text(
          numberText,
          style: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: decrement,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff4C4F5D),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FaIcon(
                    remove,
                    size: 40,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: increment,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff4C4F5D),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FaIcon(
                    add,
                    size: 40.0,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
