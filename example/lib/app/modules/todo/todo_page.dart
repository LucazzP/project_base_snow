import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_widget/mobx_widget.dart';
import 'package:project_sample_base/app/modules/todo/models/todo_model.dart';
import 'package:project_sample_base/app/modules/todo/widgets/todo_tile_widget.dart';
import 'package:projectbasesnow/projectbasesnow.dart';

import 'todo_controller.dart';

class TodoPage extends StatefulWidget {
  final String title;
  const TodoPage({Key key, this.title = "Mobx"}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends ModularState<TodoPage, TodoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ObserverFuture<ObservableList<TodoModel>, AppException>(
        observableFuture: () => controller.listTodos,
        onPending: (context) => Center(
          child: CircularProgressIndicator(),
        ),
        onError: (context, error) => Center(
          child: Text(error.toString()),
        ),
        onData: (context, data) => RefreshIndicator(
          onRefresh: controller.getTodos,
          child: Scrollbar(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return TodoTileWidget(
                  todo: data[index],
                  onPressedIcon: () => controller.checkTodo(index),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

/// Above I used ObserverFuture to show my observer, but it can be showed without it:
/// Observer(
///   builder: (_) {
///     if (controller.listTodos == null ||
///         controller.listTodos.status == FutureStatus.pending) {
///       // Loading
///       return Center(
///         child: CircularProgressIndicator(),
///       );
///     } else if (controller.listTodos.error != null) {
///       // Error
///       return Center(
///         child: Text(
///           controller.listTodos.error.toString(),
///         ),
///       );
///     }

///     return RefreshIndicator(
///       onRefresh: controller.getTodos,
///       child: Scrollbar(
///         child: ListView.builder(
///           itemCount: controller.listTodos.value.length,
///           itemBuilder: (context, index) {
///             return TodoTileWidget(
///               todo: controller.listTodos.value[index],
///               onPressedIcon: () => controller.checkTodo(index),
///             );
///           },
///         ),
///       ),
///     );
///   },
/// ),
