import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_sample_base/app/style/app_bar_theme_app.dart';
import 'package:project_sample_base/app/style/color_scheme_app.dart';
import 'package:project_sample_base/app/style/text_theme_app.dart';

/// https://medium.com/flutter-community/page-transitions-using-themedata-in-flutter-c24afadb0b5d
class ThemeDataApp {
  static bool _isDark;
  static void setIsDark(BuildContext context) {
    if (DevicePreview.of(context) == null) {
      ThemeDataApp._isDark = MediaQuery.of(context)?.platformBrightness ==
          Brightness.dark; // Use this when is not using device preview package
    } else {
      ThemeDataApp._isDark =
          DevicePreview.mediaQuery(context)?.platformBrightness ==
              Brightness.dark;
    }
  }

  static bool get isDark => ThemeDataApp._isDark;

  static ThemeData get themeData => isDark ? themeDataDark : themeDataLight;

  static final ThemeData themeDataLight = ThemeData(
    brightness: Brightness.light,
    accentColorBrightness: Brightness.light,
    primarySwatch: ColorSchemeApp.primarySwatch,
    textTheme: TextThemeApp.textTheme, // TODO Discutir sobre
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

  static final ThemeData themeDataDark = ThemeData(
    brightness: Brightness.dark,
    accentColorBrightness: Brightness.dark,
    primarySwatch: ColorSchemeApp.primarySwatch,
    textTheme: TextThemeApp.textTheme, // TODO Discutir sobre
    appBarTheme: AppBarThemeApp.appBarTheme,
    colorScheme: ColorSchemeApp.colorSchemeDark,
    pageTransitionsTheme: PageTransitionsTheme(
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
