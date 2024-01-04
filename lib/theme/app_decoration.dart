import 'package:flutter/material.dart';
import 'package:wotkout_app/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlueGray => BoxDecoration(
        color: appTheme.blueGray900,
      );
  static BoxDecoration get fillBluegray100 => BoxDecoration(
        color: appTheme.blueGray100.withOpacity(0.16),
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray900,
      );
  static BoxDecoration get fillGray600 => BoxDecoration(
        color: appTheme.gray600.withOpacity(0.28),
      );
  static BoxDecoration get fillGray80093 => BoxDecoration(
        color: appTheme.gray80093.withOpacity(0.33),
      );
  static BoxDecoration get fillGray800931 => BoxDecoration(
        color: appTheme.gray80093,
      );
  static BoxDecoration get fillGray800932 => BoxDecoration(
        color: appTheme.gray80093.withOpacity(0.15),
      );
  static BoxDecoration get fillGray90002 => BoxDecoration(
        color: appTheme.gray90002,
      );
  static BoxDecoration get fillOnError => BoxDecoration(
        color: theme.colorScheme.onError,
      );
  static BoxDecoration get fillOnPrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get fillPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.primaryContainer,
      );
  static BoxDecoration get fillRedA => BoxDecoration(
        color: appTheme.redA400,
      );

  // Gradient decorations
  static BoxDecoration get gradientGrayBToBlueGray => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.gray8009b,
            appTheme.blueGray800.withOpacity(0.61),
          ],
        ),
      );
  static BoxDecoration get gradientOnErrorContainerToOnErrorContainer =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            theme.colorScheme.onErrorContainer,
            theme.colorScheme.onErrorContainer,
          ],
        ),
      );
  static BoxDecoration get gradientOnErrorContainerToOnErrorContainer1 =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            theme.colorScheme.onErrorContainer.withOpacity(0.7),
            theme.colorScheme.onErrorContainer.withOpacity(0.7),
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: appTheme.blueGray800,
        border: Border.all(
          color: appTheme.black90001,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineBlueGray => BoxDecoration(
        color: appTheme.blueGray900,
        border: Border.all(
          color: appTheme.blueGray100,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineBluegray100 => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
        border: Border.all(
          color: appTheme.blueGray100,
          width: 3.h,
          strokeAlign: strokeAlignOutside,
        ),
      );
  static BoxDecoration get outlineBluegray1001 => BoxDecoration(
        color: appTheme.gray80093,
        border: Border.all(
          color: appTheme.blueGray100,
          width: 2.h,
        ),
      );
  static BoxDecoration get outlineBluegray900 => BoxDecoration(
        color: appTheme.blueGray900,
        border: Border.all(
          color: appTheme.blueGray900,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineBluegray9001 => BoxDecoration(
        color: appTheme.gray800,
        border: Border.all(
          color: appTheme.blueGray900,
          width: 5.h,
        ),
      );
  static BoxDecoration get outlineGrayB => BoxDecoration(
        color: theme.colorScheme.onPrimary,
        border: Border(
          bottom: BorderSide(
            color: appTheme.gray8005b,
            width: 1.h,
          ),
        ),
      );
  static BoxDecoration get outlineIndigoA => BoxDecoration(
        border: Border.all(
          color: appTheme.indigoA40001,
          width: 2.h,
        ),
      );
  static BoxDecoration get outlineIndigoA40001 => BoxDecoration(
        color: appTheme.gray80093.withOpacity(0.33),
        border: Border.all(
          color: appTheme.indigoA40001,
          width: 2.h,
        ),
      );
  static BoxDecoration get outlineOrange => BoxDecoration(
        color: theme.colorScheme.primary,
        border: Border.all(
          color: appTheme.orange600,
          width: 1.h,
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder25 => BorderRadius.circular(
        25.h,
      );
  static BorderRadius get circleBorder46 => BorderRadius.circular(
        46.h,
      );
  static BorderRadius get circleBorder56 => BorderRadius.circular(
        56.h,
      );
  static BorderRadius get circleBorder80 => BorderRadius.circular(
        80.h,
      );

  // Custom borders
  static BorderRadius get customBorderBL20 => BorderRadius.vertical(
        bottom: Radius.circular(20.h),
      );
  static BorderRadius get customBorderTL12 => BorderRadius.horizontal(
        left: Radius.circular(12.h),
      );
  static BorderRadius get customBorderTL32 => BorderRadius.vertical(
        top: Radius.circular(32.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.h,
      );
  static BorderRadius get roundedBorder15 => BorderRadius.circular(
        15.h,
      );
  static BorderRadius get roundedBorder2 => BorderRadius.circular(
        2.h,
      );
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );
  static BorderRadius get roundedBorder31 => BorderRadius.circular(
        31.h,
      );
  static BorderRadius get roundedBorder34 => BorderRadius.circular(
        34.h,
      );
  static BorderRadius get roundedBorder43 => BorderRadius.circular(
        43.h,
      );
  static BorderRadius get roundedBorder5 => BorderRadius.circular(
        5.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
