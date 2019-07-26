import 'package:flutter/material.dart';
import 'package:fitness_app/bmi_calculator/input_page/height/bmi_height_slider_circle.dart';
import 'package:fitness_app/bmi_calculator/input_page/height/bmi_height_slider_lebel.dart';
import 'package:fitness_app/bmi_calculator/input_page/height/bmi_height_slider_line.dart';

class BmiHeightSlider extends StatelessWidget {
  final int height;

  const BmiHeightSlider({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BmiHightSliderLabel(height: height),
          Row(
            children: <Widget>[
              BmiHightSliderCircle(),
              Expanded(child: BmiHeightSliderLine()),
            ],
          ),
        ],
      ),
    );
  }
}
