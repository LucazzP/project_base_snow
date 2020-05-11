import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

class ThemeDataSnow {
  static bool _isDark;
  static void setIsDark(BuildContext context) {
    if (DevicePreview.of(context) == null) {
      _isDark = MediaQuery.of(context)?.platformBrightness ==
          Brightness.dark; // Use this when is not using device preview package
    } else {
      _isDark =
          DevicePreview.mediaQuery(context)?.platformBrightness ==
              Brightness.dark;
    }
  }

  static bool get isDark => _isDark;
}