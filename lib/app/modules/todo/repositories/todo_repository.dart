import 'package:flutter_modular/flutter_modular.dart';

import '../models/todo_model.dart';

abstract class TodoRepository extends Disposable {
  Future<List<TodoModel>> getTodos();
}
