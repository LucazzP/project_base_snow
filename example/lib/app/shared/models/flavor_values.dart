import 'package:flutter/foundation.dart';
import 'package:projectbasesnow/projectbasesnow.dart';

class FlavorValuesApp implements FlavorValues{
  FlavorValuesApp({@required this.baseUrl, this.anotherUrl});

  final String baseUrl;
  final String anotherUrl;
  //Add other flavor specific values, e.g database name
}
