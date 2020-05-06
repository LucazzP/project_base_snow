import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project_sample_base/app/app_module.dart';

import 'app/shared/config/flavor_config.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.production,
    values: FlavorValues(
      baseUrl: "",
    ),
  );

  runApp(
    ModularApp(
      module: AppModule(),
    ),
  );
}
