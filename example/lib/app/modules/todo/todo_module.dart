import 'package:flutter_modular/flutter_modular.dart';
import 'package:project_sample_base/app/modules/todo/repositories/todo_repository_dio.dart';
import 'package:projectbasesnow/projectbasesnow.dart';

import 'repositories/todo_repository.dart';
import 'todo_controller.dart';
import 'todo_page.dart';

class TodoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TodoController(Modular.get<TodoRepository>())),
        Bind<TodoRepository>(
            (i) => TodoRepositoryDio(Modular.get<CustomDio>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => TodoPage()),
      ];

  static Inject get to => Inject<TodoModule>.of();
}
