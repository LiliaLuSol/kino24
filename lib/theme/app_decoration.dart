import 'package:flutter/material.dart';
import 'package:kino24/other/app_export.dart';

class AppDecoration {
  // заполенение
  static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blueP20.withOpacity(0.8),
      );
  static BoxDecoration get fillOnPrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(0.75),
      );
  static BoxDecoration get fillPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.primaryContainer,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.white,
      );

  // ГРАДИЕНТ
  static BoxDecoration get gradientBlueToBlack => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.blueP20,
            appTheme.black.withOpacity(0.2),
          ],
        ),
      );
  static BoxDecoration get gradientPrimaryToBlack => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            theme.colorScheme.primary.withOpacity(0.2),
            appTheme.black.withOpacity(0.2),
          ],
        ),
      );
  // static BoxDecoration get gradientPrimaryToBlack900 => BoxDecoration(
  //       gradient: LinearGradient(
  //         begin: Alignment(0.5, 1),
  //         end: Alignment(0.5, 0),
  //         colors: [
  //           theme.colorScheme.primary.withOpacity(0.2),
  //           appTheme.black.withOpacity(0.2),
  //         ],
  //       ),
  //     );
  // static BoxDecoration get gradientPrimaryToBlack9001 => BoxDecoration(
  //       gradient: LinearGradient(
  //         begin: Alignment(0.5, 1),
  //         end: Alignment(0.5, 0),
  //         colors: [
  //           theme.colorScheme.primary.withOpacity(0.2),
  //           theme.colorScheme.primary.withOpacity(0.2),
  //           appTheme.black.withOpacity(0.2),
  //         ],
  //       ),
  //     );
}

class BorderRadiusStyle {
  // круглый угол
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12.h,
      );
  static BorderRadius get roundedBorder15 => BorderRadius.circular(
        15.h,
      );
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );
  static BorderRadius get roundedBorder5 => BorderRadius.circular(
        5.h,
      );
}

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

