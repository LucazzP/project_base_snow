import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project_sample_base/app/style/theme_app.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter project sample base',
      theme: ThemeApp().themeData,
      darkTheme: ThemeApp().themeDataDark,
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
      themeMode: ThemeMode.light,
    );
  }
}
