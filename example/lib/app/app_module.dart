import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project_sample_base/app/shared/mock/mock_data.dart';
import 'package:project_sample_base/app/shared/models/flavor_values.dart';
import 'package:projectbasesnow/projectbasesnow.dart';

import 'app_widget.dart';
import 'modules/home/home_module.dart';
import 'modules/todo/todo_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<Dio>((i) => CustomDio(
              isMock: false /* FlavorConfig.isDevelopment */,
              baseUrl: FlavorConfig.values<FlavorValuesApp>().baseUrl,
              mockData: mockData,
            )),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router('/todo', module: TodoModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
