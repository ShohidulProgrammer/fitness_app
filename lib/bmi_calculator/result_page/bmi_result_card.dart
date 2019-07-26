import 'package:flutter/material.dart';
import 'package:fitness_app/bmi_calculator/styles.dart';

class ResultCard extends StatelessWidget {
  final double bmi;
  final double minWeight;
  final double maxWeight;

  final String bodyType;
  final double gainOrBurn;

  ResultCard(
      {Key key,
      this.bmi,
      this.minWeight,
      this.maxWeight,
      this.bodyType,
      this.gainOrBurn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        margin: EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Container(
            width: double.infinity,
            child: Column(children: [
              //  Wrap(direction: Axis.vertical, children: [

              Text(
                '🔥',

                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26.0), // fontSize: 80.0
              ),
              Text(
                bmi.toStringAsFixed(1),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 80.0,
                  fontWeight: FontWeight.bold,
                  color: textLightblue,
                ), //fontSize: 140.0,
              ),
              Text(
                // 'BMI = ${bmi.toStringAsFixed(2)} kg/m²',
                'Your Body Type: $bodyType : ${gainOrBurn.toStringAsFixed(1)} kg',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: textDarkblue,
                ), //  fontWeight: FontWeight.w700
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  'Normal BMI weight range for the height:\n${minWeight.round()}kg - ${maxWeight.round()}kg',
                  style: TextStyle(
                      fontSize: 14.0, color: textGrayblue), //Colors.grey
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
