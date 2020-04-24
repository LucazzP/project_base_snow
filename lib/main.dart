import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project_sample_base/app/app_module.dart';

void main() => runApp(
      DevicePreview(
        enabled: true,
        // enabled: !kReleaseMode,
        builder: (context) => ModularApp(
          module: AppModule(),
        ),
      ),
    );
