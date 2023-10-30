import 'package:flutter/material.dart';
import 'package:kino24/other/app_export.dart';

class CustomTextStyles {
  static get headlineLargeWhiteExtraBold32 =>
      theme.textTheme.headlineLarge!.openSans.copyWith(
        fontSize: 32.fSize,
        fontWeight: FontWeight.w800,
      );

  static get headlineLargeOrangeExtraBold32 =>
      theme.textTheme.headlineLarge!.openSans.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 32.fSize,
        fontWeight: FontWeight.w800,
      );

  static get headlineLargeWhiteSemiBold32 =>
      theme.textTheme.headlineLarge!.openSans.copyWith(
        fontSize: 32.fSize,
        fontWeight: FontWeight.w600,
      );

  static get headlineLargeOrangeSemiBold32 =>
      theme.textTheme.headlineLarge!.openSans.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 32.fSize,
        fontWeight: FontWeight.w600,
      );

  static get titleMediumLatoOnError =>
      theme.textTheme.titleMedium!.openSans.copyWith(
        color: theme.colorScheme.onError,
      );

  static get appBarActiveSemiBold =>
      theme.textTheme.headlineLarge!.openSans.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w600,
      );

  static get appBarSemiBold =>
      theme.textTheme.headlineLarge!.openSans.copyWith(
        color: appTheme.gray4F4F4F,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w600,
      );

  static get titleSemiBoldWhite14 =>
      theme.textTheme.headlineLarge!.openSans.copyWith(
        color: appTheme.white,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w600,
      );

// static get bodyLarge18 => theme.textTheme.bodyLarge!.copyWith(
//       fontSize: 18.fSize,
//     );
  static get bodyLargeBlack => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black.withOpacity(0.5),
      );

// static get bodyLargeLight => theme.textTheme.bodyLarge!.copyWith(
//       fontWeight: FontWeight.w300,
//     );
// static get bodyLargePrimary => theme.textTheme.bodyLarge!.copyWith(
//       color: theme.colorScheme.primary,
//     );
// static get bodyLargeWhiteA700 => theme.textTheme.bodyLarge!.copyWith(
//       color: appTheme.whiteA700.withOpacity(0.75),
//       fontSize: 18.fSize,
//     );
// static get bodyLargeWhiteA700_1 => theme.textTheme.bodyLarge!.copyWith(
//       color: appTheme.whiteA700.withOpacity(0.75),
//     );
// static get bodyLargeWhiteA700_2 => theme.textTheme.bodyLarge!.copyWith(
//       color: appTheme.whiteA700.withOpacity(0.75),
//     );
static get bodyLarge => theme.textTheme.bodyLarge!.copyWith(
  color: appTheme.white,
);
// static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith(
//       color: appTheme.black900.withOpacity(0.7),
//     );
// static get bodyMediumInter => theme.textTheme.bodyMedium!.inter;
  static get bodyMediumLight => theme.textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.w300,
      );
static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(
      color: theme.colorScheme.primary,
    );
static get bodyMediumWhite => theme.textTheme.bodyMedium!.copyWith(
      color: appTheme.white.withOpacity(0.7),
    );
// static get bodyMediumWhiteA700_1 => theme.textTheme.bodyMedium!.copyWith(
//       color: appTheme.whiteA700.withOpacity(0.67),
//     );
static get bodyMedium_1 => theme.textTheme.bodyMedium!;
// static get bodySmallInterWhiteA700 =>
//     theme.textTheme.bodySmall!.inter.copyWith(
//       color: appTheme.whiteA700.withOpacity(0.67),
//     );
// static get bodySmallWhiteA700 => theme.textTheme.bodySmall!.copyWith(
//       color: appTheme.whiteA700.withOpacity(0.67),
//     );
static get bodySmallWhiteLight => theme.textTheme.bodySmall!.copyWith(
      color: appTheme.white,
      fontWeight: FontWeight.w300,
    );
// static get bodySmallWhiteA700Light11 => theme.textTheme.bodySmall!.copyWith(
//       color: appTheme.whiteA700,
//       fontSize: 11.fSize,
//       fontWeight: FontWeight.w300,
//     );
static get bodySmallWhite_1 => theme.textTheme.bodySmall!.copyWith(
      color: appTheme.white,
    );
// // Headline text style
// static get headlineLargeExtraBold => theme.textTheme.headlineLarge!.copyWith(
//       fontSize: 32.fSize,
//       fontWeight: FontWeight.w800,
//     );
// static get headlineLargeLato => theme.textTheme.headlineLarge!.lato.copyWith(
//       fontSize: 32.fSize,
//       fontWeight: FontWeight.w600,
//     );
// static get headlineLargeSemiBold => theme.textTheme.headlineLarge!.copyWith(
//       fontSize: 32.fSize,
//       fontWeight: FontWeight.w600,
//     );
// // Title text style
// static get titleLargeBold => theme.textTheme.titleLarge!.copyWith(
//       fontWeight: FontWeight.w700,
//     );
// static get titleLargePrimary => theme.textTheme.titleLarge!.copyWith(
//       color: theme.colorScheme.primary,
//     );
// static get titleLarge_1 => theme.textTheme.titleLarge!;
// static get titleMedium16 => theme.textTheme.titleMedium!.copyWith(
//       fontSize: 16.fSize,
//     );
// static get titleMediumBold => theme.textTheme.titleMedium!.copyWith(
//       fontSize: 16.fSize,
//       fontWeight: FontWeight.w700,
//     );
// static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
//       color: appTheme.whiteA700.withOpacity(0.7),
//       fontSize: 16.fSize,
//     );
// static get titleMediumWhiteA70016 => theme.textTheme.titleMedium!.copyWith(
//       color: appTheme.whiteA700.withOpacity(0.75),
//       fontSize: 16.fSize,
//     );
// static get titleSmallBluegray900 => theme.textTheme.titleSmall!.copyWith(
//       color: appTheme.blueGray900,
//       fontWeight: FontWeight.w700,
//     );
// static get titleSmallOnError => theme.textTheme.titleSmall!.copyWith(
//       color: theme.colorScheme.onError,
//     );
// static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
//       color: theme.colorScheme.primary,
//     );
static get titleSmallWhite => theme.textTheme.titleSmall!.copyWith(
      color: appTheme.white,
    );
}

extension on TextStyle {
  TextStyle get openSans {
    return copyWith(
      fontFamily: 'Open Sans',
    );
  }
}
