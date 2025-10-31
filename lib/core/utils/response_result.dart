import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/core/errors/failures.dart';
part 'response_result.freezed.dart';

@freezed
sealed class ResponseResult<T> with _$ResponseResult<T> {
  const factory ResponseResult.success(T data) = ResponseResultSuccess<T>;
  const factory ResponseResult.failure(Failures failure) =
      ResponseResultFailure<T>;
}
