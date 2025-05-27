part of 'configs.dart';

class AppCoreTheme {
  Color? primaryBase;
  Color? primaryDark;
  Color? primaryLight;
  Color? primaryBackground;

  Color? secondaryBase;
  Color? secondaryDark;
  Color? secondaryLight;

  Color? neutralBlack;
  Color? neutralDarkGrey;
  Color? neutralBaseGrey;
  Color? neutralLightGrey;
  Color? neutralWhite;

  Color? successBase;
  Color? successDark;
  Color? successLight;

  Color? errorBase;
  Color? errorDark;
  Color? errorLight;

  Color? warningBase;
  Color? warningDark;
  Color? warningLight;

  AppCoreTheme({
    this.primaryBase,
    this.primaryDark,
    this.primaryLight,
    this.primaryBackground,
    this.secondaryBase,
    this.secondaryDark,
    this.secondaryLight,
    this.neutralBlack,
    this.neutralDarkGrey,
    this.neutralBaseGrey,
    this.neutralLightGrey,
    this.neutralWhite,
    this.successBase,
    this.successDark,
    this.successLight,
    this.errorBase,
    this.errorDark,
    this.errorLight,
    this.warningBase,
    this.warningDark,
    this.warningLight,
  });

  AppCoreTheme copyWith({
    Color? primaryBase,
    Color? primaryDark,
    Color? primaryLight,
    Color? primaryBackground,
    Color? secondaryBase,
    Color? secondaryDark,
    Color? secondaryLight,
    Color? neutralBlack,
    Color? neutralDarkGrey,
    Color? neutralBaseGrey,
    Color? neutralLightGrey,
    Color? neutralWhite,
    Color? successBase,
    Color? successDark,
    Color? successLight,
    Color? errorBase,
    Color? errorDark,
    Color? errorLight,
    Color? warningBase,
    Color? warningDark,
    Color? warningLight,
  }) {
    return AppCoreTheme(
      primaryBase: primaryBase ?? this.primaryBase,
      primaryDark: primaryDark ?? this.primaryDark,
      primaryLight: primaryLight ?? this.primaryLight,
      primaryBackground: primaryBackground ?? this.primaryBackground,
      secondaryBase: secondaryBase ?? this.secondaryBase,
      secondaryDark: secondaryDark ?? this.secondaryDark,
      secondaryLight: secondaryLight ?? this.secondaryLight,
      neutralBlack: neutralBlack ?? this.neutralBlack,
      neutralDarkGrey: neutralDarkGrey ?? this.neutralDarkGrey,
      neutralBaseGrey: neutralBaseGrey ?? this.neutralBaseGrey,
      neutralLightGrey: neutralLightGrey ?? this.neutralLightGrey,
      neutralWhite: neutralWhite ?? this.neutralWhite,
      successBase: successBase ?? this.successBase,
      successDark: successDark ?? this.successDark,
      successLight: successLight ?? this.successLight,
      errorBase: errorBase ?? this.errorBase,
      errorDark: errorDark ?? this.errorDark,
      errorLight: errorLight ?? this.errorLight,
      warningBase: warningBase ?? this.warningBase,
      warningDark: warningDark ?? this.warningDark,
      warningLight: warningLight ?? this.warningLight,
    );
  }
}
