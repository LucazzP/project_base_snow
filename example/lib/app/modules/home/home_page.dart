import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:project_sample_base/app/shared/widgets/flavor_banner/flavor_banner_widget.dart';
import 'home_controller.dart';
import 'home_page.i18n.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: PlatformButton(
          onPressed: () => Navigator.of(context).pushNamed('/todo'),
          child: Text(
            "Página Todo".i18n,
          ),
        ),
      ),
    );
  }
}
