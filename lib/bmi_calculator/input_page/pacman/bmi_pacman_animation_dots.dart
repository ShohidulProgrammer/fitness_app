import 'package:flutter/material.dart';
import 'package:fitness_app/bmi_calculator/input_page/pacman/bmi_pacman_dots.dart';
import 'package:fitness_app/bmi_calculator/input_page/pacman/bmi_pacman_sinusoidal_animation.dart';
import 'package:fitness_app/bmi_calculator/widget_utils.dart';

const double _pacmanWidth = 21.0;
const double _sliderHorizontalMargin = 24.0;
const double _dotsLeftMargin = 8.0;

class AnimatedDots extends StatefulWidget {
  @override
  _AnimatedDotsState createState() => _AnimatedDotsState();
}

class _AnimatedDotsState extends State<AnimatedDots>
    with TickerProviderStateMixin {
  final int numberOfDots = 10;
  final double minOpacity = 0.1;
  final double maxOpacity = 0.5;
  AnimationController hintAnimationController;

  @override
  void initState() {
    super.initState();
    _initHintAnimationController();
    hintAnimationController.forward();
  }

  @override
  void dispose() {
    hintAnimationController.dispose();
    super.dispose();
  }

  void _initHintAnimationController() {
    hintAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750), // milliseconds: 800
    );
    hintAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(milliseconds: 550), () {
          // milliseconds: 800
          if (this.mounted) {
            hintAnimationController.forward(from: 0.0);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            left: screenAwareSize(
                _sliderHorizontalMargin + _pacmanWidth + _dotsLeftMargin,
                context),
            right: screenAwareSize(_sliderHorizontalMargin, context)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(numberOfDots, _generateDot)
            ..add(Opacity(
              opacity: maxOpacity,
              child: Dot(size: 14.0),
            )),
        ),
      ),
    );
  }

  Widget _generateDot(int dotNumber) {
    Animation animation = _initDotAnimation(dotNumber);
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => Opacity(
            opacity: animation.value,
            child: child,
          ),
      child: Dot(size: 9.0),
    );
  }

  Animation<double> _initDotAnimation(int dotNumber) {
    double lastDotStartTime = 0.4;
    double dotAnimationDuration = 0.5;
    double begin = lastDotStartTime * dotNumber / numberOfDots;
    double end = begin + dotAnimationDuration;
    return SinusoidalAnimation(min: minOpacity, max: maxOpacity).animate(
      CurvedAnimation(
        parent: hintAnimationController,
        curve: Interval(begin, end),
      ),
    );
  }
}
