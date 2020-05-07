import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:dio_interceptors/dio_interceptors.dart';
import 'package:project_sample_base/app/shared/dio/interceptors/cache_interceptor.dart';
import 'package:project_sample_base/app/shared/dio/mock/mock_data.dart';
import 'package:project_sample_base/app/shared/models/exception_custom.dart';
import 'interceptors/log_interceptor.dart' as log;

class CustomDio extends DioForNative {
  CustomDio({bool isMock = false, String baseUrl}) {
    options.connectTimeout = 10000;
    options.sendTimeout = 10000;
    options.receiveTimeout = 10000;
    options.baseUrl = baseUrl;

    interceptors.add(log.LogInterceptor());
    if (isMock) {
      interceptors.add(InterceptorMock(mockData));
    } else {
      final dioCache = DioCacheManager(CacheConfig(
        baseUrl: options.baseUrl,
      ));
      interceptors.add(dioCache.interceptor);
      interceptors.add(CacheInterceptor());
    }
  }

  Future<Response<T>> _errorHandler<T>(
      Future<Response<T>> Function() request) async {
    try {
      Exception _error;
      final _res = request();
      await _res.catchError((e) {
        _error = e;
      });
      if (_error != null) throw _error;
      return _res;
    } on AppException catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) =>
      _errorHandler(
        () => super
            .get<T>(
          path,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        )
            .catchError(
          (e) {
            throw AppException(
              message: e.message ?? e.response.data.toString(),
              statusCode: e.response?.statusCode ?? 404,
              dioError: e,
            );
          },
        ),
      );

  /// Handy method to make http POST request, which is a alias of  [BaseDio.request].
  @override
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) =>
      _errorHandler(
        () => super
            .post<T>(
          path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        )
            .catchError(
          (e) {
            throw AppException(
              message: e.message ?? e.response.data.toString(),
              statusCode: e.response?.statusCode ?? 404,
              dioError: e,
            );
          },
        ),
      );

  /// Handy method to make http PUT request, which is a alias of  [BaseDio.request].
  @override
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) =>
      _errorHandler(
        () => super
            .put<T>(
          path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        )
            .catchError(
          (e) {
            throw AppException(
              message: e.message ?? e.response.data.toString(),
              statusCode: e.response?.statusCode ?? 404,
              dioError: e,
            );
          },
        ),
      );

  /// Handy method to make http DELETE request, which is a alias of  [BaseDio.request].
  @override
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
  }) =>
      _errorHandler(
        () => super
            .delete<T>(
          path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        )
            .catchError(
          (e) {
            throw AppException(
              message: e.message ?? e.response.data.toString(),
              statusCode: e.response?.statusCode ?? 404,
              dioError: e,
            );
          },
        ),
      );

  /// Handy method to make http PATCH request, which is a alias of  [BaseDio.request].
  @override
  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) =>
      _errorHandler(() => super
              .patch<T>(
            path,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
            onSendProgress: onSendProgress,
          )
              .catchError(
            (e) {
              throw AppException(
                message: e.message ?? e.response.data.toString(),
                statusCode: e.response?.statusCode ?? 404,
                dioError: e,
              );
            },
          ));
}
