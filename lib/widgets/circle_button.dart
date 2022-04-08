import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Weight',
          style: TextStyle(fontSize: 25.0),
        ),
        Text(
          '60',
          style: TextStyle(fontSize: 50.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                    color: Color(0xff4C4F5D), shape: BoxShape.circle),
                child: FaIcon(FontAwesomeIcons.minus)),
            FaIcon(
              FontAwesomeIcons.plus,
              size: 50.0,
            ),
          ],
        )
      ],
    );
  }
}
