import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/core/errors/failures.dart';
part 'result.freezed.dart';

@freezed
sealed class Result<T> with _$Result<T> {
  const factory Result.success(T data) = ResultSuccess<T>;
  const factory Result.failure(Failures failure) = ResultFailure<T>;
}
