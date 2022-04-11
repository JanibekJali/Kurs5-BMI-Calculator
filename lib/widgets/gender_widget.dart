import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({
    Key key,
    @required this.icons,
    @required this.text,
    @required this.onTap,
  }) : super(key: key);

  final IconData icons;
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: FaIcon(
            icons,
            size: 75.0,
          ),
        ),
        Text(
          text,
          style: TextStyle(fontSize: 25.0),
        ),
      ],
    );
  }
}
