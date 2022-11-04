import 'package:flutter/material.dart';

class SizeConfig {
  final BuildContext context;
  SizeConfig(this.context);
  static double? blockWidth;
  static double? blockHeight;
  static double? screenWidth;

  void init() {
    blockWidth = MediaQuery.of(context).size.width / 100.0;
    blockHeight = MediaQuery.of(context).size.height / 100.0;
    screenWidth = MediaQuery.of(context).size.width / 360.0;
  }

  static double? setWidth(num value) => value / 3.6 * (blockWidth ?? 1.0);
  static double? setHeight(double value) => value / 6.40 * (blockHeight ?? 1.0);
  static double? setTextSp(double value) => (blockWidth ?? 1.0) > .6
      ? value / 6.40 * (blockHeight ?? 1.0)
      : value / 3.60 * (blockWidth ?? 1.0);
  static double? setTextSpWithWidth(double value) =>
      value * (screenWidth ?? 1.0);
}

extension ResponsiveSize on double {
  double? get w => SizeConfig.setWidth(this);
  double? get h => SizeConfig.setHeight(this);
  double? get sp => SizeConfig.setTextSp(this);
  double? get spByWidth => SizeConfig.setTextSpWithWidth(this);
}
