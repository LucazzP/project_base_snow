import 'package:flutter/material.dart';

class ThemeApp {
  static final ThemeApp _singleton = ThemeApp._internal();

  factory ThemeApp() {
    return _singleton;
  }

  ThemeApp._internal();

  ThemeData get themeData => ThemeData(
        brightness: Brightness.light,
        primarySwatch: primarySwatch,
        iconTheme: IconThemeData(
          color: primarySwatch[500],
        ),
      );

  ThemeData get themeDataDark => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: primarySwatch,
        iconTheme: IconThemeData(
          color: primarySwatch[500],
        ),
      );

  MaterialColor primarySwatch = MaterialColor(
    0xFFEB5A52,
    const <int, Color>{
      50: const Color(0xFFFEECEE),
      100: const Color(0xFFFDCED2),
      200: const Color(0xFFEC9D9B),
      300: const Color(0xFFE27775),
      400: const Color(0xFFEB5A52),
      500: const Color(0xFFEF4C39),
      600: const Color(0xFFE14338),
      700: const Color(0xFFCF3A32),
      800: const Color(0xFFC2342B),
      900: const Color(0xFFB3291F),
    },
  );
}
