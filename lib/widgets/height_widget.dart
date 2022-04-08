import 'package:flutter/material.dart';

class HeightWidget extends StatelessWidget {
  HeightWidget({this.currentValue, this.onChangedSlider});
  final int currentValue;
  final Function(double value) onChangedSlider;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Height'.toUpperCase(),
          style: TextStyle(
            fontSize: 25.0,
            letterSpacing: 1.0,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              currentValue.toString() ?? '480',
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'cm',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.red,
            inactiveTrackColor: Colors.white,
            thumbColor: Colors.redAccent,
            overlayColor: Colors.green,
            // thumbShape: RoundRangeSliderThumbShape(enabledThumbRadius: 10.),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 15.0),
          ),
          child: Slider(
            value: currentValue.toDouble(),
            // min: 0,
            max: 220,
            // divisions: 10,
            onChanged: onChangedSlider,
          ),
        ),
      ],
    );
  }
}
