import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLarge17 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 17.fSize,
      );
  static get bodyLargeErrorContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.errorContainer,
        fontSize: 17.fSize,
      );
  static get bodyLargeIndigo400 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.indigo400,
      );
  static get bodyLargeNewYork => theme.textTheme.bodyLarge!.newYork.copyWith(
        fontSize: 17.fSize,
      );
  static get bodyMediumBlack90001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black90001,
      );
  static get bodyMediumInikaBluegray100 =>
      theme.textTheme.bodyMedium!.inika.copyWith(
        color: appTheme.blueGray100,
        fontSize: 15.fSize,
      );
  static get bodyMediumInikaBluegray900 =>
      theme.textTheme.bodyMedium!.inika.copyWith(
        color: appTheme.blueGray900,
        fontSize: 15.fSize,
      );
  static get bodyMediumInikaGray600 =>
      theme.textTheme.bodyMedium!.inika.copyWith(
        color: appTheme.gray600.withOpacity(0.9),
        fontSize: 15.fSize,
      );
  static get bodyMediumInikaIndigoA40001 =>
      theme.textTheme.bodyMedium!.inika.copyWith(
        color: appTheme.indigoA40001,
        fontSize: 15.fSize,
      );
  static get bodyMediumInikaWhiteA700 =>
      theme.textTheme.bodyMedium!.inika.copyWith(
        color: appTheme.whiteA700,
        fontSize: 15.fSize,
      );
  static get bodyMediumInterWhiteA700 =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: appTheme.whiteA700.withOpacity(0.6),
      );
  static get bodyMediumKhmerBlack90001 =>
      theme.textTheme.bodyMedium!.khmer.copyWith(
        color: appTheme.black90001,
      );
  static get bodyMediumSFProBlack90001 =>
      theme.textTheme.bodyMedium!.sFPro.copyWith(
        color: appTheme.black90001,
        fontSize: 14.fSize,
      );
  static get bodyMediumWhiteA700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyMediumWhiteA70015 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 15.fSize,
      );
  static get bodySmall12 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 12.fSize,
      );
  static get bodySmall8 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 8.fSize,
      );
  static get bodySmallBlack90001 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black90001,
        fontSize: 12.fSize,
      );
  static get bodySmallBluegray100 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray100,
        fontSize: 8.fSize,
      );
  static get bodySmallBluegray10012 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray100,
        fontSize: 12.fSize,
      );
  static get bodySmallBluegray1008 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray100.withOpacity(0.64),
        fontSize: 8.fSize,
      );
  static get bodySmallBluegray100_1 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray100,
      );
  static get bodySmallGray600 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray600,
        fontSize: 8.fSize,
      );
  static get bodySmallOnPrimaryContainer => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 8.fSize,
      );
  static get bodySmallSFPro => theme.textTheme.bodySmall!.sFPro.copyWith(
        fontSize: 9.fSize,
      );
  static get bodySmallSFProTextBluegray100 =>
      theme.textTheme.bodySmall!.sFProText.copyWith(
        color: appTheme.blueGray100,
        fontSize: 12.fSize,
      );
  // Display text style
  static get displayMediumBold => theme.textTheme.displayMedium!.copyWith(
        fontSize: 50.fSize,
        fontWeight: FontWeight.w700,
      );
  static get displayMediumPrimary => theme.textTheme.displayMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 45.fSize,
        fontWeight: FontWeight.w700,
      );
  static get displaySmallInikaWhiteA700 =>
      theme.textTheme.displaySmall!.inika.copyWith(
        color: appTheme.whiteA700,
        fontSize: 36.fSize,
        fontWeight: FontWeight.w700,
      );
  static get displaySmallNewYorkExtraLargePrimary =>
      theme.textTheme.displaySmall!.newYorkExtraLarge.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 34.fSize,
        fontWeight: FontWeight.w600,
      );
  // Headline text style
  static get headlineLargeWhiteA700 => theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get headlineMediumSFProPrimary =>
      theme.textTheme.headlineMedium!.sFPro.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
      );
  static get headlineSmallDMSans =>
      theme.textTheme.headlineSmall!.dMSans.copyWith(
        fontSize: 24.fSize,
      );
  static get headlineSmallPrimary => theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  // Label text style
  static get labelLargeGray600 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray600,
      );
  static get labelLargeIndigoA40001 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.indigoA40001,
      );
  static get labelLargeInter => theme.textTheme.labelLarge!.inter.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get labelLargeInterAmber400 =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: appTheme.amber400,
        fontSize: 13.fSize,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeInterLightgreenA400 =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: appTheme.lightGreenA400,
        fontSize: 13.fSize,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeWhiteA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700.withOpacity(0.63),
      );
  static get labelMediumGray600 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.gray600,
      );
  static get labelMediumOpenSansWhiteA700 =>
      theme.textTheme.labelMedium!.openSans.copyWith(
        color: appTheme.whiteA700,
        fontSize: 11.fSize,
      );
  static get labelMediumWhiteA700 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  // Title text style
  static get titleLarge20 => theme.textTheme.titleLarge!.copyWith(
        fontSize: 20.fSize,
      );
  static get titleLarge22 => theme.textTheme.titleLarge!.copyWith(
        fontSize: 22.fSize,
      );
  static get titleLargeBlack90001 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black90001,
      );
  static get titleLargeIndigoA40001 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.indigoA40001,
      );
  static get titleLargeInter => theme.textTheme.titleLarge!.inter.copyWith(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleLargeOpenSans =>
      theme.textTheme.titleLarge!.openSans.copyWith(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleLargePrimary => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w400,
      );
  static get titleLargePrimary_1 => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleLargeRegular => theme.textTheme.titleLarge!.copyWith(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
      );
  static get titleMediumDMSansPrimary =>
      theme.textTheme.titleMedium!.dMSans.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 17.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumOpenSans =>
      theme.textTheme.titleMedium!.openSans.copyWith(
        fontSize: 17.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumOpenSansBlack90001 =>
      theme.textTheme.titleMedium!.openSans.copyWith(
        color: appTheme.black90001,
        fontSize: 17.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 19.fSize,
      );
  static get titleMediumSFPro => theme.textTheme.titleMedium!.sFPro.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleMediumSFProGray90001 =>
      theme.textTheme.titleMedium!.sFPro.copyWith(
        color: appTheme.gray90001,
      );
  static get titleMediumSFProPrimary =>
      theme.textTheme.titleMedium!.sFPro.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleMediumSFProSecondaryContainer =>
      theme.textTheme.titleMedium!.sFPro.copyWith(
        color: theme.colorScheme.secondaryContainer,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumSFProSecondaryContainer_1 =>
      theme.textTheme.titleMedium!.sFPro.copyWith(
        color: theme.colorScheme.secondaryContainer,
      );
  static get titleMediumSFProSemiBold =>
      theme.textTheme.titleMedium!.sFPro.copyWith(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumSFProText =>
      theme.textTheme.titleMedium!.sFProText.copyWith(
        fontSize: 17.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumSFProTextBlack90001 =>
      theme.textTheme.titleMedium!.sFProText.copyWith(
        color: appTheme.black90001,
        fontSize: 17.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumSFProTextDeeporange500 =>
      theme.textTheme.titleMedium!.sFProText.copyWith(
        color: appTheme.deepOrange500,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumSFProTextDeeporange500SemiBold =>
      theme.textTheme.titleMedium!.sFProText.copyWith(
        color: appTheme.deepOrange500,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumSFProTextLightblue200 =>
      theme.textTheme.titleMedium!.sFProText.copyWith(
        color: appTheme.lightBlue200,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumSFProTextSemiBold =>
      theme.textTheme.titleMedium!.sFProText.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleMediumSFProTextSemiBold_1 =>
      theme.textTheme.titleMedium!.sFProText.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleSmall14 => theme.textTheme.titleSmall!.copyWith(
        fontSize: 14.fSize,
      );
  static get titleSmallDMSansBlack900 =>
      theme.textTheme.titleSmall!.dMSans.copyWith(
        color: appTheme.black900,
        fontSize: 14.fSize,
      );
  static get titleSmallInter => theme.textTheme.titleSmall!.inter.copyWith(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallOpenSans =>
      theme.textTheme.titleSmall!.openSans.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 14.fSize,
      );
}

extension on TextStyle {
  TextStyle get sFPro {
    return copyWith(
      fontFamily: 'SF Pro',
    );
  }

  TextStyle get openSans {
    return copyWith(
      fontFamily: 'Open Sans',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get khmer {
    return copyWith(
      fontFamily: 'Khmer',
    );
  }

  TextStyle get newYork {
    return copyWith(
      fontFamily: 'New York',
    );
  }

  TextStyle get newYorkLarge {
    return copyWith(
      fontFamily: 'New York Large',
    );
  }

  TextStyle get newYorkExtraLarge {
    return copyWith(
      fontFamily: 'New York Extra Large',
    );
  }

  TextStyle get dMSans {
    return copyWith(
      fontFamily: 'DM Sans',
    );
  }

  TextStyle get inika {
    return copyWith(
      fontFamily: 'Inika',
    );
  }

  TextStyle get sFProText {
    return copyWith(
      fontFamily: 'SF Pro Text',
    );
  }
}
