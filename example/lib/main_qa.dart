import 'package:catcher/catcher_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project_sample_base/app/app_module.dart';

import 'app/shared/config/catcher_config.dart';
import 'app/shared/config/flavor_config.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.qa,
    color: Colors.deepPurpleAccent
  );

  Catcher(
    ModularApp(
      module: AppModule(),
    ),
    navigatorKey: Modular.navigatorKey,
    debugConfig: CatcherConfig.debugOptions,
    releaseConfig: CatcherConfig.releaseOptions,
  );
}
