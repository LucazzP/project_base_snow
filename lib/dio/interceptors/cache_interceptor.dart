import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class CacheInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    /// use [ Options(extra: {"useCache": false}) ] to control the cache, true by default
    if (options.extra['useCache'] ??
        true && options.responseType != ResponseType.stream) {
      final _optionsCache = buildCacheOptions(
        Duration(days: 3),
        maxStale: Duration(days: 7),
      );
      options.extra.addAll(_optionsCache.extra);
    }

    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    return super.onResponse(response);
  }

  @override
  Future onError(DioError dioError) {
    return super.onError(dioError);
  }
}
