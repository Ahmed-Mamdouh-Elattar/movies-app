part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;
  const factory AuthState.loading() = Loading;
  const factory AuthState.success(UserCredential user) = Success;
  const factory AuthState.failure(String message) = Failure;
}
