import 'package:flutter/material.dart';
import 'package:project_sample_base/app/modules/todo/models/todo_model.dart';

class TodoTileWidget extends StatelessWidget {
  final TodoModel todo;
  final void Function() onPressedIcon;
  const TodoTileWidget({Key key, this.todo, this.onPressedIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      leading: IconButton(
        onPressed: onPressedIcon,
        icon: Icon(
          todo.completed ? Icons.check_box : Icons.check_box_outline_blank,
        ),
      ),
    );
  }
}
