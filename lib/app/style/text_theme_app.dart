import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextThemeApp {
  /// https://material.io/design/typography/the-type-system.html#type-scale - Helps to create textTheme

  static TextTheme get textTheme => textThemeRoboto;

  static TextTheme textThemeRoboto = TextTheme(
    display4: GoogleFonts.roboto(
      fontSize: 96,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
    ),
    display3: GoogleFonts.roboto(
      fontSize: 60,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
    ),
    display2: GoogleFonts.roboto(
      fontSize: 48,
      fontWeight: FontWeight.w400,
    ),
    display1: GoogleFonts.roboto(
      fontSize: 34,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    headline: GoogleFonts.roboto(
      fontSize: 24,
      fontWeight: FontWeight.w400,
    ),
    title: GoogleFonts.roboto(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),
    subhead: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
    ),
    subtitle: GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    body1: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
    body2: GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    button: GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
    ),
    caption: GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
    ),
    overline: GoogleFonts.roboto(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
    ),
  );
}