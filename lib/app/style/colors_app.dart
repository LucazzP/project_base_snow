import 'package:flutter/painting.dart';

class ColorsApp {
  static final ColorsApp _singleton = ColorsApp._internal();

  factory ColorsApp() {
    return _singleton;
  }

  ColorsApp._internal();

  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffFFFFFF);
}