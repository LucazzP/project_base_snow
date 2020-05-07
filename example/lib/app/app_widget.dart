import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:project_sample_base/app/shared/widgets/flavor_banner/flavor_banner_widget.dart';
import 'package:project_sample_base/app/style/theme_app.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context, nullOk: true);

    return MaterialApp(
      title: 'Flutter project sample base',
      locale: DevicePreview.of(context)?.locale, // <--
      builder: (context, child) => _AppBuilder(child: child),
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
      initialRoute: '/',
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeDataApp.themeDataLight,
      darkTheme: ThemeDataApp.themeDataDark,
      themeMode: mediaQuery?.platformBrightness == null
          ? ThemeMode.system
          : mediaQuery?.platformBrightness == Brightness.dark
              ? ThemeMode.dark
              : ThemeMode.light,
    );
  }
}

class _AppBuilder extends StatelessWidget {
  final Widget child;
  const _AppBuilder({Key key, @required this.child}) : super(key: key);

  Widget get _body => I18n(
        child: ResponsiveWrapper.builder(
          FlavorBannerWidget(
            child: child,
          ),
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(
            color: Color(0xFFF5F5F5),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    ThemeDataApp.setIsDark(context);
    if (DevicePreview.of(context) == null) {
      return _body;
    } else {
      return DevicePreview.appBuilder(
        context,
        _body,
      );
    }
  }
}
