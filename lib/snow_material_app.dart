import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'style/theme_app.dart';
import 'widgets/flavor_banner/flavor_banner_widget.dart';

class SnowMaterialApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget home;
  final Map<String, WidgetBuilder> routes;
  final String initialRoute;
  final RouteFactory onGenerateRoute;
  final InitialRouteListFactory onGenerateInitialRoutes;
  final RouteFactory onUnknownRoute;
  final List<NavigatorObserver> navigatorObservers;
  final TransitionBuilder builder;
  final String title;
  final GenerateAppTitle onGenerateTitle;
  final ThemeData theme;
  final ThemeData darkTheme;
  final ThemeMode themeMode;
  final Color color;
  final Locale locale;
  final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates;
  final LocaleListResolutionCallback localeListResolutionCallback;
  final LocaleResolutionCallback localeResolutionCallback;
  final Iterable<Locale> supportedLocales;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;
  final Map<LogicalKeySet, Intent> shortcuts;
  final Map<Type, Action<Intent>> actions;
  final bool debugShowMaterialGrid;

  const SnowMaterialApp({
    Key key,
    this.navigatorKey,
    this.home,
    this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.builder,
    this.title = 'Flutter project sample base',
    this.onGenerateTitle,
    this.color,
    this.theme,
    this.darkTheme,
    this.themeMode = ThemeMode.system,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const [
      Locale('en', 'US'),
      Locale('pt', 'BR'),
    ],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context, nullOk: true);

    return MaterialApp(
      title: title,
      locale: locale ?? DevicePreview.of(context)?.locale, // <--
      builder: (context, child) =>
          _AppBuilder(child: builder == null ? child : builder(context, child)),
      navigatorKey: navigatorKey ?? Modular.navigatorKey,
      onGenerateRoute: onGenerateRoute ?? Modular.generateRoute,
      initialRoute: initialRoute ?? '/',
      supportedLocales: supportedLocales,
      localizationsDelegates: localizationsDelegates ??
          [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
      theme: theme ?? ThemeDataApp.themeDataLight,
      darkTheme: darkTheme ?? ThemeDataApp.themeDataDark,
      themeMode: themeMode ??
          (mediaQuery?.platformBrightness == null
              ? ThemeMode.system
              : mediaQuery?.platformBrightness == Brightness.dark
                  ? ThemeMode.dark
                  : ThemeMode.light),
      home: home,
      routes: routes,
      onGenerateInitialRoutes: onGenerateInitialRoutes,
      onUnknownRoute: onUnknownRoute,
      navigatorObservers: navigatorObservers,
      onGenerateTitle: onGenerateTitle,
      color: color,
      localeListResolutionCallback: localeListResolutionCallback,
      localeResolutionCallback: localeResolutionCallback,
      showPerformanceOverlay: showPerformanceOverlay,
      checkerboardRasterCacheImages: checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers,
      showSemanticsDebugger: showSemanticsDebugger,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      shortcuts: shortcuts,
      actions: actions,
      debugShowMaterialGrid: debugShowMaterialGrid,
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
