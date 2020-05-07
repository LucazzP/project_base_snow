import 'package:catcher/catcher_plugin.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projectbasesnow/projectbasesnow.dart';

import 'config/flavor_config.dart';

class RunAppSnow {
  final Widget rootWidget;
  final FlavorValues flavorValues;
  final Flavor flavor;
  final GlobalKey<NavigatorState> navigatorKey;
  final CatcherOptions catcherDebugConfig;
  final CatcherOptions catcherProfileConfig;
  final CatcherOptions catcherReleaseConfig;
  final bool enableDevicePreview;

  RunAppSnow(
    this.rootWidget, {
    @required this.flavorValues,
    this.flavor = Flavor.production,
    this.navigatorKey,
    this.catcherDebugConfig,
    this.catcherProfileConfig,
    this.catcherReleaseConfig,
    this.enableDevicePreview = false,
  }) {
    FlavorConfig(
      flavor: flavor,
      color: flavor == Flavor.dev ? Colors.green : Colors.deepPurpleAccent,
      values: flavorValues,
    );

    Catcher(
      enableDevicePreview && !kReleaseMode
          ? DevicePreview(
              builder: (context) => rootWidget,
            )
          : rootWidget,
      navigatorKey: navigatorKey ?? Modular?.navigatorKey,
      debugConfig: catcherDebugConfig ?? _debugOptions,
      releaseConfig: catcherReleaseConfig ?? _releaseOptions,
      profileConfig: catcherProfileConfig,
    );
  }

  final _debugOptions = CatcherOptions(
    SilentReportMode(),
    [ConsoleHandler()],
  );

  final _releaseOptions = CatcherOptions(DialogReportMode(), [
    EmailManualHandler(["email@example.com"])
  ]);
}
