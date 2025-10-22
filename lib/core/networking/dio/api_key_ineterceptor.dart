import 'package:dio/dio.dart';
import 'package:movies_app/core/helper/api_keys.dart';

class ApiKeyInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({'api_key': apiKey});

    return handler.next(options);
  }
}
