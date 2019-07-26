import 'dart:math' as math;

import 'package:fitness_app/bmi_calculator/input_page/pacman/bmi_pacman_animation_dots.dart';

import 'package:fitness_app/bmi_calculator/input_page/pacman/bmi_pacman_icon.dart';
import 'package:fitness_app/bmi_calculator/widget_utils.dart';
import 'package:flutter/material.dart';

const double _pacmanWidth = 21.0;
const double _sliderHorizontalMargin = 24.0;

class PacmanSlider extends StatefulWidget {
  final VoidCallback onSubmit;
  final AnimationController submitAnimationController;

  const PacmanSlider({Key key, this.onSubmit, this.submitAnimationController})
      : super(key: key);

  @override
  _PacmanSliderState createState() => _PacmanSliderState();
}

class _PacmanSliderState extends State<PacmanSlider>
    with TickerProviderStateMixin {
  double _pacmanPosition = 24.0;
  Animation<BorderRadius> _bordersAnimation;
  Animation<double> _submitWidthAnimation;
  AnimationController pacmanMovementController;
  Animation<double> pacmanAnimation;

  @override
  void initState() {
    super.initState();
    pacmanMovementController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _bordersAnimation = BorderRadiusTween(
      begin: BorderRadius.circular(8.0),
      end: BorderRadius.circular(50.0),
    ).animate(CurvedAnimation(
      parent: widget.submitAnimationController,
      curve: Interval(0.0, 0.07),
    ));
  }

  @override
  void dispose() {
    pacmanMovementController.dispose();
    super.dispose();
  }

  double get width => _submitWidthAnimation?.value ?? 0.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _submitWidthAnimation = Tween<double>(
          begin: constraints.maxWidth,
          end: screenAwareSize(52.0, context),
        ).animate(CurvedAnimation(
          parent: widget.submitAnimationController,
          curve: Interval(0.05, 0.15),
        ));
        return AnimatedBuilder(
          animation: widget.submitAnimationController,
          builder: (context, child) {
            Decoration decoration = BoxDecoration(
              borderRadius: _bordersAnimation.value,
              color: Color.fromRGBO(41, 170, 62, 1.0),
              //Theme.of(context).primaryColor,
            );

            return Center(
              child: Container(
                height: screenAwareSize(52.0, context),
                width: width,
                decoration: decoration,
                child: _submitWidthAnimation.isDismissed
                    ? GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () => _animatePacmanToEnd(),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: <Widget>[
                            AnimatedDots(),
                            _drawDotCurtain(decoration),
                            _drawPacman(),
                          ],
                        ),
                      )
                    : Container(),
              ),
            );
          },
        );
      },
    );
  }

  Widget _drawDotCurtain(Decoration decoration) {
    if (width == 0.0) {
      return Container();
    }
    double marginRight =
        width - _pacmanPosition - screenAwareSize(_pacmanWidth / 2, context);
    return Positioned.fill(
      right: marginRight,
      child: Container(decoration: decoration),
    );
  }

  Widget _drawPacman() {
    pacmanAnimation = _initPacmanAnimation();
    return Positioned(
      left: _pacmanPosition,
      child: GestureDetector(
        onHorizontalDragUpdate: (details) => _onPacmanDrag(width, details),
        onHorizontalDragEnd: (details) => _onPacmanEnd(width, details),
        child: PacmanIcon(),
      ),
    );
  }

  Animation<double> _initPacmanAnimation() {
    Animation<double> animation = Tween(
      begin: _pacmanMinPosition(),
      end: _pacmanMaxPosition(width),
    ).animate(pacmanMovementController);

    animation.addListener(() {
      setState(() {
        _pacmanPosition = animation.value;
      });
      if (animation.status == AnimationStatus.completed) {
        _onPacmanSubmited();
      }
    });
    return animation;
  }

  _onPacmanSubmited() {
    widget?.onSubmit();
    Future.delayed(Duration(seconds: 1), () => _resetPacman());
  }

  _onPacmanDrag(double width, DragUpdateDetails details) {
    setState(() {
      _pacmanPosition += details.delta.dx;
      _pacmanPosition = math.max(_pacmanMinPosition(),
          math.min(_pacmanMaxPosition(width), _pacmanPosition));
    });
  }

  _onPacmanEnd(double width, DragEndDetails details) {
    bool isOverHalf =
        _pacmanPosition + screenAwareSize(_pacmanWidth / 2, context) >
            0.5 * width;
    if (isOverHalf) {
      _animatePacmanToEnd();
    } else {
      _resetPacman();
    }
  }

  _animatePacmanToEnd() {
    pacmanMovementController.forward(
        from: _pacmanPosition / _pacmanMaxPosition(width));
  }

  _resetPacman() {
    if (this.mounted) {
      setState(() => _pacmanPosition = _pacmanMinPosition());
    }
  }

  double _pacmanMinPosition() =>
      screenAwareSize(_sliderHorizontalMargin, context);

  double _pacmanMaxPosition(double sliderWidth) =>
      sliderWidth -
      screenAwareSize(_sliderHorizontalMargin / 2 + _pacmanWidth, context);
}
