import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio createDio(String baseUrl, {String? token}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Accept': 'application/json'},
    ),
  );

  // Logger (dev)
  dio.interceptors.add(
    PrettyDioLogger(error: true, responseBody: true, requestBody: true),
  );

  return dio;
}
