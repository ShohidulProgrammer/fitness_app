import 'package:flutter/material.dart';
import 'package:fitness_app/bmi_calculator/input_page/bmi_input_summary_card.dart';
import 'package:fitness_app/bmi_calculator/input_page/input_page_styles.dart';

import 'package:fitness_app/bmi_calculator/widget_utils.dart';

class BmiAppBar extends StatelessWidget {
  final BmiInputSummaryCard bmiInputSummaryCard;

  final bool isInputPage;
  // static const String wavingHandEmoji = "\uD83D\uDC4B";
  static const String whiteSkinTone = "\uD83C\uDFFB";

  const BmiAppBar({Key key, this.isInputPage = true, this.bmiInputSummaryCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.0,
      child: Container(
        height: appBarHeight(context),
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(screenAwareSize(16.0, context)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildLabel(context),
              // _buildIcon(context),
            ],
          ),
        ),
      ),
    );
  }

  // Padding _buildIcon(BuildContext context) {
  //   return Padding(
  //     padding: EdgeInsets.only(bottom: screenAwareSize(11.0, context)),
  //     child: SvgPicture.asset(
  //       'images/user.svg',
  //       height: screenAwareSize(20.0, context),
  //       width: screenAwareSize(20.0, context),
  //     ),
  //   );
  // }

  RichText _buildLabel(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style.copyWith(fontSize: 34.0),
        children: [
          TextSpan(
            text: isInputPage
                ? " ${bmiInputSummaryCard.build(context)}"
                : "Your BMI",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          // TextSpan(text: isInputPage ? getEmoji(context) : ""),
        ],
      ),
    );
  }

  // https://github.com/flutter/flutter/issues/9652
  // String getEmoji(BuildContext context) {
  //   return Theme.of(context).platform == TargetPlatform.iOS
  //       ? wavingHandEmoji
  //       : wavingHandEmoji + whiteSkinTone;
  // }
  String getEmoji(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.iOS
        ? null
        : whiteSkinTone;
  }
}
