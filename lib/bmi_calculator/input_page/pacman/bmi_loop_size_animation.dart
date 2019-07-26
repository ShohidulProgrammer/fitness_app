import 'dart:math' as math;
import 'package:flutter/material.dart';

class LoopedSizeAnimation extends Animatable<double> {
  final double defaultSize = 52.0;
  final double expansionRange = 30.0;
  final int numberOfCycles = 2;
  final double fullExpansionEdge = 0.8;

  @override
  double transform(double t) {
    if (t < fullExpansionEdge) {
      double normalizedT = t / fullExpansionEdge;
      return defaultSize +
          math.sin(numberOfCycles * 2 * math.pi * normalizedT) * expansionRange;
    } else {
      double normalizedT = (t - fullExpansionEdge) / (1 - fullExpansionEdge);
      return defaultSize + normalizedT * 2000.0;
    }
  }
}
