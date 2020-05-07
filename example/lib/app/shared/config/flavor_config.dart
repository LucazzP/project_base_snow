import 'package:flutter/material.dart';
import '../extensions.dart';
import 'flavor_values.dart';

@immutable
class FlavorConfig {
  final Flavor flavor;
  final String name;
  final Color color;
  final FlavorValues values;
  static FlavorConfig _instance;

  factory FlavorConfig({@required Flavor flavor, Color color = Colors.blue}) {
    _instance ??= FlavorConfig._internal(
        flavor, flavor.toString().getNameFromEnum(), color, _valuesFromFlavor(flavor));
    return _instance;
  }

  static FlavorValues _valuesFromFlavor(Flavor flavor) {
    switch (flavor) {
      case Flavor.dev:
        return FlavorValues(
          baseUrl: 'https://jsonplaceholder.typicode.com',
        );
      case Flavor.qa:
        return FlavorValues(
          baseUrl: 'https://jsonplaceholder.typicode.com',
        );
      case Flavor.production:
        return FlavorValues(
          baseUrl: 'https://jsonplaceholder.typicode.com',
        );
      default:
        return null;
    }
  }

  const FlavorConfig._internal(this.flavor, this.name, this.color, this.values);
  static FlavorConfig get instance => _instance;

  static bool get isProduction => _instance.flavor == Flavor.production;
  static bool get isDevelopment => _instance.flavor == Flavor.dev;
  static bool get isQA => _instance.flavor == Flavor.qa;
}

enum Flavor { dev, qa, production }
