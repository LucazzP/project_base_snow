// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoController on _TodoControllerBase, Store {
  final _$listTodosAtom = Atom(name: '_TodoControllerBase.listTodos');

  @override
  ObservableFuture<ObservableList<TodoModel>> get listTodos {
    _$listTodosAtom.context.enforceReadPolicy(_$listTodosAtom);
    _$listTodosAtom.reportObserved();
    return super.listTodos;
  }

  @override
  set listTodos(ObservableFuture<ObservableList<TodoModel>> value) {
    _$listTodosAtom.context.conditionallyRunInAction(() {
      super.listTodos = value;
      _$listTodosAtom.reportChanged();
    }, _$listTodosAtom, name: '${_$listTodosAtom.name}_set');
  }

  final _$getTodosAsyncAction = AsyncAction('getTodos');

  @override
  Future<ObservableList<TodoModel>> getTodos() {
    return _$getTodosAsyncAction.run(() => super.getTodos());
  }

  final _$_TodoControllerBaseActionController =
      ActionController(name: '_TodoControllerBase');

  @override
  void checkTodo(int index) {
    final _$actionInfo = _$_TodoControllerBaseActionController.startAction();
    try {
      return super.checkTodo(index);
    } finally {
      _$_TodoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'listTodos: ${listTodos.toString()}';
    return '{$string}';
  }
}
