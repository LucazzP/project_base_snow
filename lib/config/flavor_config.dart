import 'package:flutter/material.dart';
import 'package:projectbasesnow/models/flavor_values.dart';
import '../extensions.dart';

@immutable
class FlavorConfig {
  final Flavor _flavor;
  final String _name;
  final Color _color;
  final FlavorValues _values;
  static FlavorConfig _instance;

  factory FlavorConfig({@required Flavor flavor, Color color = Colors.blue, @required FlavorValues values}) {
    _instance ??= FlavorConfig._internal(flavor,
        flavor.toString().getNameFromEnum(), color, values);
    return _instance;
  }

  FlavorConfig._internal(this._flavor, this._name, this._color, this._values);

  static bool get isProduction => _instance._flavor == Flavor.production;
  static bool get isDevelopment => _instance._flavor == Flavor.dev;
  static bool get isQA => _instance._flavor == Flavor.qa;
  static Flavor get flavor => _instance._flavor;
  static String get name => _instance._name;
  static Color get color => _instance._color;
  static T values<T extends FlavorValues>() => _instance._values;
}

enum Flavor { dev, qa, production }