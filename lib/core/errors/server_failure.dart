import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/failures.dart';

class ServerFailure extends Failures {
  ServerFailure({required super.errMessage});
  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          errMessage: "Connection timeout with API server,please try again",
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure(
          errMessage: "Send timeout with API server,please try again",
        );
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          errMessage: "Receive timeout with API server,please try again",
        );
      case DioExceptionType.badCertificate:
        return ServerFailure(
          errMessage: "bad certificate with API server,please try again",
        );
      case DioExceptionType.badResponse:
        return ServerFailure.badResponseError(dioException);
      case DioExceptionType.cancel:
        return ServerFailure(
          errMessage: "Request is canceled,please try again",
        );
      case DioExceptionType.connectionError:
        return ServerFailure(
          errMessage: "Check your internet connection and try again",
        );
      case DioExceptionType.unknown:
        return ServerFailure(
          errMessage: "Oops there was an error,please try again",
        );
    }
  }

  factory ServerFailure.badResponseError(DioException dioException) {
    if (dioException.response!.statusCode == 400 ||
        dioException.response!.statusCode == 401 ||
        dioException.response!.statusCode == 403) {
      return ServerFailure(
        errMessage: dioException.response!.data["error"]["message"],
      );
    } else if (dioException.response!.statusCode == 404) {
      return ServerFailure(
        errMessage: "Your request not found , please try later!",
      );
    } else if (dioException.response!.statusCode == 500) {
      return ServerFailure(errMessage: "Internal Server error , try later!");
    } else {
      return ServerFailure(
        errMessage: "Oops there was an error,please try again",
      );
    }
  }
}
