import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:project_sample_base/app/style/app_bar_theme_app.dart';
import 'package:project_sample_base/app/style/color_scheme_app.dart';
import 'package:project_sample_base/app/style/text_theme_app.dart';

class ThemeDataApp {
  static bool _isDark;
  static void setIsDark(BuildContext context) => ThemeDataApp._isDark =
      DevicePreview.mediaQuery(context)?.platformBrightness == Brightness.dark;
  // MediaQuery.of(context)?.platformBrightness == Brightness.dark; // Use this when is not using device preview package
  static bool get isDark => ThemeDataApp._isDark;

  static ThemeData get themeData => isDark ? themeDataDark : themeDataLight;

  static ThemeData themeDataLight = ThemeData(
    brightness: Brightness.light,
    primarySwatch: ColorSchemeApp.primarySwatch,
    textTheme: TextThemeApp.textTheme, // TODO Discutir sobre
    colorScheme: ColorSchemeApp.colorScheme,
    appBarTheme: AppBarThemeApp.appBarTheme,
    iconTheme: IconThemeData(
      color: ColorSchemeApp.primarySwatch[500],
    ),
  );

  static ThemeData themeDataDark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: ColorSchemeApp.primarySwatch,
    colorScheme: ColorSchemeApp.colorScheme.copyWith(
      brightness: Brightness.dark,
    ),
    textTheme: TextThemeApp.textTheme, // TODO Discutir sobre
    iconTheme: IconThemeData(
      color: ColorSchemeApp.primarySwatch[500],
    ),
  );
}
