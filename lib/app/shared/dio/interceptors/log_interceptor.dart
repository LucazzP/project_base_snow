import 'package:dio/dio.dart';

class LogInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    print('METHOD: ${options.method} \nDATA: [${options.data}] \nURL: ${options.uri}');
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print('RESPONSE: ${response.statusCode} \n Data: ${response.data} \n Data Length: ${response.data.length}');
    return super.onResponse(response);
  }

  
  @override
  Future onError(DioError dioError) {
    print('ERROR: ${dioError.response.statusCode} \n Message: ${dioError.message} \n Data: ${dioError.response.data}');
    return super.onError(dioError);
  }
}