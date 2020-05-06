import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app/app_module.dart';
import 'app/shared/config/flavor_config.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.dev,
    color: Colors.green,
    values: FlavorValues(
      baseUrl: "",
    ),
  );

  runApp(
    DevicePreview(
      enabled: true ?? !kReleaseMode,
      builder: (context) => ModularApp(
        module: AppModule(),
      ),
    ),
  );
}
