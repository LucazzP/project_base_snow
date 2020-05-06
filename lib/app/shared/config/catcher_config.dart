import 'package:catcher/catcher_plugin.dart';

class CatcherConfig {
  //debug configuration
  static final debugOptions = CatcherOptions(
    DialogReportMode(),
    [ConsoleHandler()],
  );

  //release configuration
  static final releaseOptions = CatcherOptions(DialogReportMode(), [
    EmailManualHandler(["lucas.polazzo@snowmanlabs.com"])
  ]);
}