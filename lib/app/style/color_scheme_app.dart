import 'package:flutter/material.dart';
import 'package:project_sample_base/app/style/theme_app.dart';

class ColorSchemeApp {
  static ColorScheme get colorScheme => ThemeDataApp.isDark ? colorSchemeDark : colorSchemeLight;

  static final ColorScheme colorSchemeLight = ColorScheme.fromSwatch(
    brightness: Brightness.light,
    primarySwatch: primarySwatch,
  );
  
  static final ColorScheme colorSchemeDark = ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: primarySwatch,
  );

  static final MaterialColor primarySwatch = MaterialColor(
    0xFFEB5A52,
    const <int, Color>{
      50: Color(0xFFFEECEE),
      100: Color(0xFFFDCED2),
      200: Color(0xFFEC9D9B),
      300: Color(0xFFE27775),
      400: Color(0xFFEB5A52),
      500: Color(0xFFEF4C39),
      600: Color(0xFFE14338),
      700: Color(0xFFCF3A32),
      800: Color(0xFFC2342B),
      900: Color(0xFFB3291F),
    },
  );
}