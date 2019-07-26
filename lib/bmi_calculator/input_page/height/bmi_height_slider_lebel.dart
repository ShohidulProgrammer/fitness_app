import 'package:flutter/material.dart';
import 'package:fitness_app/bmi_calculator/input_page/height/height_styles.dart';
import 'package:fitness_app/bmi_calculator/widget_utils.dart';

class BmiHightSliderLabel extends StatelessWidget {
  final int height;

  const BmiHightSliderLabel({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int foot = (height / 12).floor();
    int inch = height % 12;
    return Padding(
      padding: EdgeInsets.only(
        left: screenAwareSize(4.0, context),
        bottom: screenAwareSize(2.0, context),
      ),
      child: Text(
        // "$height",
        "$foot Foot + $inch Inch",
        style: TextStyle(
          fontSize: selectedLabelFontSize + 10,
          color: Colors.blueGrey, //Theme.of(context).primaryColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
