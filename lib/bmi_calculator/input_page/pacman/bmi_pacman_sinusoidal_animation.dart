import 'dart:math' as math;
import 'package:flutter/material.dart';

class SinusoidalAnimation extends Animatable<double> {
  SinusoidalAnimation({this.min, this.max});

  final double min;
  final double max;

  @override
  double transform(double t) {
    return min + (max - min) * math.sin(math.pi * t);
  }
}
