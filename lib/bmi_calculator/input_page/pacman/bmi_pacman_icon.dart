import 'package:flutter/material.dart';
import 'package:fitness_app/bmi_calculator/widget_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PacmanIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: screenAwareSize(16.0, context),
      ),
      child: SvgPicture.asset(
        'assets/bmi_assets/bmi_images/pacman.svg',
        height: screenAwareSize(25.0, context),
        width: screenAwareSize(21.0, context),
      ),
    );
  }
}
