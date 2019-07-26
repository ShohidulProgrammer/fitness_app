import 'package:flutter/material.dart';
import 'package:fitness_app/bmi_calculator/model/gender.dart';
import 'package:fitness_app/bmi_calculator/widget_utils.dart';

class BmiInputSummaryCard extends StatelessWidget {
  final Gender gender;
  final int height;
  final int weight;

  const BmiInputSummaryCard({Key key, this.gender, this.height, this.weight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
          top: screenAwareSize(42.0, context),
          right: screenAwareSize(16.0, context),
          left: screenAwareSize(16.0, context),
          bottom: screenAwareSize(5.0, context)),
      child: SizedBox(
        height: screenAwareSize(32.0, context),
        child: Row(
          children: <Widget>[
            Expanded(child: _genderText()),
            _divider(),
            Expanded(child: _text("${weight}kg")),
            _divider(),
            Expanded(child: _text("${height}Inch")),
          ],
        ),
      ),
    );
  }

  Text _genderText() {
    String genderText = gender == Gender.other
        ? '-'
        : (gender == Gender.male ? 'Male' : 'Female');
    return _text(genderText);
  }

  Widget _text(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Color.fromRGBO(143, 144, 156, 1.0),
        fontSize: 15.0,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _divider() {
    return Container(
      width: 1.0,
      color: Color.fromRGBO(237, 237, 237, 0.1), //  151, 151, 151
    );
  }
}
