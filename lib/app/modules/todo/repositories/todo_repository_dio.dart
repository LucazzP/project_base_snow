import 'package:dio/dio.dart';
import '../models/todo_model.dart';
import 'todo_repository.dart';

class TodoRepositoryDio implements TodoRepository {
  final Dio _client;

  TodoRepositoryDio(this._client);

  Future<List<TodoModel>> getTodos() async {
    final response =
        await _client.get<List>('https://jsonplaceholder.typicode.com/todos/');
    return response.data
        .map<TodoModel>((element) => TodoModel.fromMap(element))
        .toList();
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
