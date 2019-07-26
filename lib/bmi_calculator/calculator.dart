import 'dart:math' as math;

double bmi;
double minHealthyWeight;
double maxHealthyWeight;
double burn;
double gain;
String body;

double calculateBMI({int height, int weight}) =>
    bmi = weight / _heightSquared(height);

double calculateMinNormalWeight({int height}) =>
    minHealthyWeight = 19 * _heightSquared(height);

double calculateMaxNormalWeight({int height}) =>
    maxHealthyWeight = 24.9 * _heightSquared(height);

// double _heightSquared(int height) => math.pow(height / 100, 2);
double _heightSquared(int height) => math.pow(height * 0.0254, 2);

double calculateGainOrBurn({int weight}) => bmi >= 19 && bmi <= 24.9
    ? gain = 0
    : (bmi > 24.9)
        ? burn = (weight - maxHealthyWeight)
        : gain = (minHealthyWeight - weight);

String bodyType() => ((19 <= bmi) && (bmi <= 24.9))
    // ? body = "You’re in the healthy range.\n Burn or Gain"
    ? body = "healthy Body.\n Burn or Gain"
    : (bmi > 24.9)
        // ? body = "You're Considered Overweight.\n Burn Minimum"
        ? body = "Overweight.\n Burn Minimum"
        : body = "Underweight.\n Gain Minimum";

String exerciseType() {
  if (bmi < 16.0) {
    return "SevereThinness";
  } else if (bmi >= 16.0 && bmi <= 16.9) {
    return "ModerateThinness";
  } else if (bmi >= 17.0 && bmi <= 18.49) {
    return "MildThinness";
  } else if (bmi >= 18.5 && bmi <= 22.9) {
    return "NormalRange";
  } else if (bmi >= 23.0 && bmi <= 24.9) {
    return "PreOverWeight";
  } else if (bmi == 25.0) {
    return "OverWeight";
  } else if (bmi > 25.0 && bmi <= 27.49) {
    return "ModerateOverWeight";
  } else if (bmi >= 27.5 && bmi <= 29.9) {
    return "SevereOverWeight";
  } else if (bmi == 30.0) {
    return "Obese";
  } else if (bmi > 30.0 && bmi <= 34.9) {
    return "MildObese";
  } else if (bmi >= 35.0 && bmi <= 39.9) {
    return "ModerateObese";
  } else if (bmi >= 40.0) {
    return "SevereObese";
  } else
    return "OverWeight";
}
