import 'dart:ui';
import 'package:kino24/other/app_export.dart';
import 'package:flutter/material.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillGray => ElevatedButton.styleFrom(
        backgroundColor: appTheme.gray4F4F4F,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.h),
        ),
      );

  // Gradient button style
  static BoxDecoration get gradientBlueToBlackDecoration => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.blueP20,
            appTheme.black.withOpacity(0.2),
          ],
        ),
      );
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
