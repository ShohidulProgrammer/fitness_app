import 'package:fitness_app/bmi_calculator/app_bar.dart';
import 'package:fitness_app/bmi_calculator/calculator.dart' as calculator;
import 'package:fitness_app/bmi_calculator/input_page/input_page_styles.dart';
import 'package:fitness_app/bmi_calculator/model/gender.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/bmi_calculator/result_page/bmi_result_card.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ResultPage extends StatefulWidget {
  final int height;
  final int weight;
  final Gender gender;

  const ResultPage({Key key, this.height, this.weight, this.gender})
      : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: BmiAppBar(isInputPage: false),
        preferredSize: Size.fromHeight(appBarHeight(context)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ResultCard(
            bmi: calculator.calculateBMI(
                height: widget.height, weight: widget.weight),
            minWeight:
                calculator.calculateMinNormalWeight(height: widget.height),
            maxWeight:
                calculator.calculateMaxNormalWeight(height: widget.height),
            bodyType: calculator.bodyType(),
            gainOrBurn: calculator.calculateGainOrBurn(weight: widget.weight),
          ),
          _buildBottomBar(),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: IconButton(
              tooltip: "Your own Routine",
              icon: Icon(
                // Icons.delete,
                Icons.fitness_center,
                color: Colors.grey,
                size: 28.0,
              ),
              // onPressed: () => Navigator.of(context).pop(),
              onPressed: () => Navigator.of(context).pushNamed('/GymType'),
            ),
          ),
          Container(
              height: 52.0,
              width: 80.0,
              child: RaisedButton(
                child: Icon(
                  Icons.refresh,
                  color: Colors.white,
                  size: 28.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                onPressed: () => Navigator.of(context).pop(),
                color: Theme.of(context).primaryColor,
              )),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: IconButton(
              icon: Icon(
                MaterialCommunityIcons.food_apple,
                color: Colors.grey,
                size: 28.0,
              ),
              onPressed: () => Navigator.of(context).pushNamed('/DietType'),
            ),
          ),
        ],
      ),
    );
  }
}
