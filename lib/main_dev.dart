import 'package:catcher/catcher_plugin.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app/app_module.dart';
import 'app/shared/config/catcher_config.dart';
import 'app/shared/config/flavor_config.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.dev,
    color: Colors.green,
    values: FlavorValues(
      baseUrl: "",
    ),
  );

  Catcher(
    DevicePreview(
      enabled: true ?? !kReleaseMode,
      builder: (context) => ModularApp(
        module: AppModule(),
      ),
    ),
    navigatorKey: Modular.navigatorKey,
    debugConfig: CatcherConfig.debugOptions,
    releaseConfig: CatcherConfig.releaseOptions,
  );
}
