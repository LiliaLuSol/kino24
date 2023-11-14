import 'package:flutter/material.dart';
import 'package:kino24/other/app_export.dart';

class AppDecoration {
  // заполенение
  static BoxDecoration get fillOnPrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(0.75),
      );

  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.white,
      );
}

class BorderRadiusStyle {
  // круглый угол
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12.h,
      );

  static BorderRadius get roundedBorder15 => BorderRadius.circular(
        15.h,
      );
}
