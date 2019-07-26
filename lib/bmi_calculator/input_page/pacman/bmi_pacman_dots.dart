import 'package:flutter/material.dart';
import 'package:fitness_app/bmi_calculator/widget_utils.dart';

class Dot extends StatelessWidget {
  final double size;

  const Dot({Key key, @required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenAwareSize(size, context),
      width: screenAwareSize(size, context),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }
}
