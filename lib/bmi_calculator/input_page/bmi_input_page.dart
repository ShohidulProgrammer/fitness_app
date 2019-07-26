import 'package:fitness_app/bmi_calculator/fade_route.dart';
import 'package:fitness_app/bmi_calculator/input_page/bmi_input_summary_card.dart';
import 'package:fitness_app/bmi_calculator/input_page/gender/gender_card.dart';
import 'package:fitness_app/bmi_calculator/input_page/height/height_card.dart';
import 'package:fitness_app/bmi_calculator/input_page/input_page_styles.dart';
import 'package:fitness_app/bmi_calculator/input_page/pacman/pacman_slider.dart';
import 'package:fitness_app/bmi_calculator/input_page/pacman/transition_dot.dart';
import 'package:fitness_app/bmi_calculator/input_page/weight/weight_card.dart';
import 'package:fitness_app/bmi_calculator/model/gender.dart';
import 'package:fitness_app/bmi_calculator/result_page/result_page.dart';
import 'package:fitness_app/bmi_calculator/widget_utils.dart';
import 'package:flutter/material.dart';

class BmiInputPage extends StatefulWidget {
  @override
  BmiInputPageState createState() {
    return new BmiInputPageState();
  }
}

class BmiInputPageState extends State<BmiInputPage>
    with TickerProviderStateMixin {
  AnimationController _submitAnimationController;
  // Gender gender = Gender.other;
  Gender gender = Gender.female;
  int height = 70;
  int weight = 60;

  @override
  void initState() {
    super.initState();
    _submitAnimationController = AnimationController(
      vsync: this,
      // duration: Duration(seconds: 2),
      duration: Duration(milliseconds: 750),
    );
    _submitAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _goToResultPage().then((_) => _submitAnimationController.reset());
      }
    });
  }

  @override
  void dispose() {
    _submitAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: PreferredSize(
            child: BmiInputSummaryCard(
              gender: gender,
              weight: weight,
              height: height,
            ),
            preferredSize: Size.fromHeight(appBarHeight(context)),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // BmiInputSummaryCard(
              //   gender: gender,
              //   weight: weight,
              //   height: height,
              // ),
              Expanded(child: _buildCards(context)),
              _buildBottom(context),
            ],
          ),
        ),
        TransitionDot(animation: _submitAnimationController),
      ],
    );
  }

  Widget _buildCards(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              Expanded(
                child: GenderCard(
                  gender: gender,
                  onChanged: (val) => setState(() => gender = val),
                ),
              ),
              Expanded(
                child: WeightCard(
                  weight: weight,
                  onChanged: (val) => setState(() => weight = val),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: HeightCard(
            height: height,
            onChanged: (val) => setState(() => height = val),
          ),
        )
      ],
    );
  }

  Widget _buildBottom(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: screenAwareSize(16.0, context),
        right: screenAwareSize(16.0, context),
        bottom: screenAwareSize(22.0, context),
        top: screenAwareSize(14.0, context),
      ),
      child: PacmanSlider(
        submitAnimationController: _submitAnimationController,
        onSubmit: onPacmanSubmit,
      ),
    );
  }

  void onPacmanSubmit() {
    _submitAnimationController.forward();
  }

  _goToResultPage() async {
    return Navigator.of(context).push(FadeRoute(
      builder: (context) => ResultPage(
            weight: weight,
            height: height,
            gender: gender,
          ),
    ));
  }
}
