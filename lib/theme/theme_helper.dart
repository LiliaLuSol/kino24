import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kino24/other/app_export.dart';

//для цвета и тем
class ThemeHelper {
  //текущая тема
  var _appTheme = PrefUtils().getThemeData();

// карта цветов
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// карта цветовых схем
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  //возврат основных тем
  PrimaryColors _getThemeColors() {
    //если ошибка
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception("$_appTheme не найден");
    }
    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  //возврат текущих данных темы
  ThemeData _getThemeData() {
    //если ошибка
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception("$_appTheme не найден");
    }

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.white.withOpacity(0.9),
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        side: const BorderSide(
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.gray4F4F4F,
      ),
    );
  }

  //возврат основных цветов темы
  PrimaryColors themeColor() => _getThemeColors();

  // возврат текущих данных темы
  ThemeData themeData() => _getThemeData();
}

//для стилей
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        headlineLarge: TextStyle(
          color: appTheme.white,
          fontSize: 30.fSize,
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          color: appTheme.white,
          fontSize: 18.fSize,
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: TextStyle(
          color: appTheme.white,
          fontSize: 14.fSize,
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w400,
        ),
      );
}

//цветовые схемы
class ColorSchemes {
  static final primaryColorScheme = const ColorScheme.light(
    primary: Color(0XFFFF5733),
    primaryContainer: Color(0XFF1E1E1E),
    background: Color(0XFF121212),
    error: Color(0XCC121212),
    onPrimary: Color(0XCC121212),
    onSecondary: Color(0XFFBCBCBC),
    outline: Color(0XCC121212),
    onSurface: Color(0XFFBCBCBC),
  );
}

// все цвета
class PrimaryColors {
  // Black
  Color get black => const Color(0XFF000000);

  Color get blackBack => const Color(0XFF121212);

  Color get blackBackP80 => const Color(0XCC121212);

  // White
  Color get white => const Color(0XFFFFFFFF);

  // Blue b Orange прозрачность ~20
  Color get blueP20 => const Color(0X333498DB);

  Color get orangeP20 => const Color(0X33FF5733);

  Color get whiteP70 => const Color(0XB3FFFFFF);

  Color get greenP80 => const Color(0XCC49A21E);

  Color get bluelightP80 => const Color(0XCC3498DB);

  // BlueGray
  Color get blueGray100 => const Color(0XFFD9D9D9);

  Color get gray7C => const Color(0XFF7C7C7C);

  // Gray
  Color get gray100 => const Color(0XFFF5F5F5);

  Color get gray700 => const Color(0XFF626262);

  Color get gray4F4F4F => const Color(0XFF4F4F4F);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();

ThemeData get theme => ThemeHelper().themeData();
