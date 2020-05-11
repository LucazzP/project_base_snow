import 'package:flutter_modular/flutter_modular.dart';
import 'package:project_sample_base/app/app_module.dart';
import 'package:projectbasesnow/projectbasesnow.dart';

import 'app/shared/models/flavor_values.dart';

void main() {
  RunAppSnow(
    ModularApp(
      module: AppModule(),
    ),
    flavorValues: FlavorValuesApp(
      baseUrl: 'https://jsonplaceholder.typicode.com',
    ),
    flavor: Flavor.production,
  );
}
