import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../lib/app/modules/todo/todo_module.dart';

void main() {
  initModule(TodoModule());
  // TodoController mobx;
  //
  setUp(() {
    //     mobx = TodoModule.to.get<TodoController>();
  });

  group('TodoController Test', () {
    //   test("First Test", () {
    //     expect(mobx, isInstanceOf<TodoController>());
    //   });

    //   test("Set Value", () {
    //     expect(mobx.value, equals(0));
    //     mobx.increment();
    //     expect(mobx.value, equals(1));
    //   });
  });
}
