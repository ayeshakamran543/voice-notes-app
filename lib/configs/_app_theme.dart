part of 'configs.dart';

class AppTheme {
  static final _core = AppCoreTheme(
    primaryBase: Color(0xFF6A3EA1),
    primaryDark: Color(0xFF3A2258),
    primaryLight: Color(0xFFEFE9F7),
    primaryBackground: Color(0xFFFAF8FC),

    secondaryBase: Color(0xFFDEDC52),
    secondaryDark: Color(0xFF565510),
    secondaryLight: Color(0xFFF7F6D4),

    neutralBlack: Color(0xFF180E25),
    neutralDarkGrey: Color(0xFF827D89),
    neutralBaseGrey: Color(0xFFC8C5CB),
    neutralLightGrey: Color(0xFFEFEFEF),
    neutralWhite: Color(0xFFFFFFFF),

    successBase: Color(0xFF60DB89),
    successDark: Color(0xFF1F7F40),
    successLight: Color(0xFFDAF6E4),

    errorBase: Color(0xFFCE3A54),
    errorDark: Color(0xFF5A1623),
    errorLight: Color(0xFFF7DEE3),

    warningBase: Color(0xFFF8C715),
    warningDark: Color(0xFF725A03),
    warningLight: Color(0xFFFDEBAB),
  );

  static AppCoreTheme light = _core;
  static AppCoreTheme dark = _core;

  static late AppCoreTheme c;

  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  static init(BuildContext context) {
    c = isDark(context) ? dark : light;
  }
}
