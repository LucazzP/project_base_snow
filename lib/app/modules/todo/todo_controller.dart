import 'package:mobx/mobx.dart';
import '../../shared/extensions.dart';
import 'models/todo_model.dart';
import 'repositories/todo_repository.dart';

part 'todo_controller.g.dart';

class TodoController = _TodoControllerBase with _$TodoController;

abstract class _TodoControllerBase with Store {
  final TodoRepository _repo;

  _TodoControllerBase(this._repo) {
    getTodos();
  }

  @observable
  ObservableFuture<ObservableList<TodoModel>> listTodos;

  @action
  Future<ObservableList<TodoModel>> getTodos() async {
    listTodos = _repo
        .getTodos()
        .map<ObservableList<TodoModel>>(
            (transform) async => (await transform).asObservable())
        .asObservable();
    return listTodos;
  }

  @action
  void checkTodo(int index) {
    final todo = listTodos.value[index];
    listTodos.value[index] = todo.copyWith(completed: !todo.completed);
  }
}
