import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:project_sample_base/app/style/theme_app.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ThemeDataApp.setIsDark(context);
    final mediaQuery = MediaQuery.of(context, nullOk: true);
    return PlatformApp(
      title: 'Flutter project sample base',
      locale: DevicePreview.of(context)?.locale, // <--
      builder: (context, widget) {
        ThemeDataApp.setIsDark(context);
        return DevicePreview.appBuilder(context, widget);
      }, // <--
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
      initialRoute: '/',
      supportedLocales: const [
        Locale('en'),
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      android: (_) => MaterialAppData(
        theme: ThemeDataApp.themeDataLight,
        darkTheme: ThemeDataApp.themeDataDark,
        themeMode: mediaQuery?.platformBrightness == null
            ? ThemeMode.system
            : mediaQuery?.platformBrightness == Brightness.dark
                ? ThemeMode.dark
                : ThemeMode.light,
      ),
      ios: (_) => CupertinoAppData(
        theme: CupertinoThemeData(brightness: Brightness.light),
      ),
    );
  }
}
