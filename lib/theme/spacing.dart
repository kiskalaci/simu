import "package:flutter/material.dart";

abstract class Spacing {
  ///2
  static const double quarter = 2;

  ///4
  static const double half = 4;

  ///8
  static const double baseStep = 8;

  ///12
  static const double twelve = 12;

  ///16
  static const double doubled = 16;

  ///24
  static const double triple = 24;

  ///32
  static const double large = 32;

  ///40
  static const double xl = 40;

  ///48
  static const double xxl = 48;

  ///72
  static const double huge = 72;
}

extension SpacingExtension on double {
  Widget get horizontalGap => SizedBox(width: this);
  Widget get verticalGap => SizedBox(height: this);
}
