import 'package:dio/dio.dart';
import 'dart:async';

class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int maxRetries;
  final Duration retryDelay;

  RetryInterceptor(
    this.dio, {
    this.maxRetries = 3, // عدد المحاولات قبل الاستسلام
    this.retryDelay = const Duration(seconds: 2), // تأخير بين كل محاولة
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // بنشوف نوع الخطأ هل هو timeout ولا لا
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout) {
      final requestOptions = err.requestOptions;

      // نحاول نجيب عدد المحاولات اللي اتعملت قبل كده
      int retryCount = requestOptions.extra["retryCount"] ?? 0;

      if (retryCount < maxRetries) {
        // بنزود عدد المحاولات
        retryCount++;
        requestOptions.extra["retryCount"] = retryCount;

        // نطبع في الـ console علشان نتابع
        // ignore: avoid_print
        print(
          '⚠️ Timeout happened, retrying... ($retryCount/$maxRetries) after ${retryDelay.inSeconds}s',
        );

        // ننتظر شوية قبل ما نعيد المحاولة
        await Future.delayed(retryDelay);

        try {
          // نعيد تنفيذ نفس الطلب بنفس الإعدادات
          final response = await dio.fetch(requestOptions);
          // لو نجح، نحل الخطأ ونرجع النتيجة
          return handler.resolve(response);
        } catch (e) {
          // لو فشل تاني، نمشي الخطأ للمحاولة التالية
          return handler.next(err);
        }
      }
    }

    // لو الخطأ مش Timeout أو عدينا عدد المحاولات، نمشي الخطأ عادي
    super.onError(err, handler);
  }
}
