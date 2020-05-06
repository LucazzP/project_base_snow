import 'package:dio_interceptors/dio_interceptors.dart';

final mockData = Mock()
  ..add(
    path: "/login",
    method: MockMethod.POST,
    success: {"token": "token123", "success": true},
    error: {"message": "Email e/ou senha inválidos"},
    body: {"email": "email@email.com", "password": "123456"},
  );
