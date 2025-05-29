part of 'configs.dart';

const fontFamily = 'Inter';

final themeLight = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: AppTheme.light.primaryBackground,
    foregroundColor: AppTheme.light.primaryBase,
    elevation: 0,
    iconTheme: IconThemeData(color: AppTheme.light.primaryBase),
  ),
  primaryColor: AppTheme.light.primaryBase,
  brightness: Brightness.light,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  scaffoldBackgroundColor: AppTheme.light.primaryBackground,
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: WidgetStateProperty.all(AppTheme.light.primaryBase),
  ),
  primaryColorDark: AppTheme.light.primaryBase,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: AppTheme.light.primaryBase,
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  colorScheme: ThemeData.light().colorScheme.copyWith(
    secondary: AppTheme.light.neutralWhite,
    surface: AppTheme.light.primaryBackground,
    onSurface: AppTheme.light.primaryBase,
    primary: AppTheme.light.primaryBase,
  ),
);
