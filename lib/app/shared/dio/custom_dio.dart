import 'package:dio/native_imp.dart';
import 'interceptors/log_interceptor.dart';

class CustomDio extends DioForNative {
  CustomDio() {
    interceptors.add(LogInterceptor());
  }
}