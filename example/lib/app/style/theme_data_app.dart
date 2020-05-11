import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectbasesnow/projectbasesnow.dart';

import 'app_bar_theme_app.dart';
import 'color_scheme_app.dart';
import 'text_theme_app.dart';

/// https://medium.com/flutter-community/page-transitions-using-themedata-in-flutter-c24afadb0b5d
class ThemeDataApp extends ThemeDataSnow {

  static bool get isDark => ThemeDataSnow.isDark; 

  static ThemeData get themeData =>
      ThemeDataSnow.isDark ? themeDataDarkDefault : themeDataLightDefault;

  static final ThemeData themeDataLightDefault = ThemeData(
    brightness: Brightness.light,
    accentColorBrightness: Brightness.light,
    primarySwatch: ColorSchemeApp.primarySwatch,
    textTheme: TextThemeApp.textTheme,
    appBarTheme: AppBarThemeApp.appBarTheme,
    colorScheme: ColorSchemeApp.colorSchemeLight,
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
      },
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      brightness: Brightness.light,
    ),
    iconTheme: IconThemeData(
      color: ColorSchemeApp.primarySwatch[500],
    ),
  );

  static final ThemeData themeDataDarkDefault = ThemeData(
    brightness: Brightness.dark,
    accentColorBrightness: Brightness.dark,
    primarySwatch: ColorSchemeApp.primarySwatch,
    textTheme: TextThemeApp.textTheme,
    appBarTheme: AppBarThemeApp.appBarTheme,
    colorScheme: ColorSchemeApp.colorSchemeDark,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
      },
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      brightness: Brightness.dark,
    ),
    iconTheme: IconThemeData(
      color: ColorSchemeApp.primarySwatch[500],
    ),
  );
}
