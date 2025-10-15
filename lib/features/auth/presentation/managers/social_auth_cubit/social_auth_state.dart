part of 'social_auth_cubit.dart';

@freezed
class SocialAuthState with _$SocialAuthState {
  const factory SocialAuthState.initial() = Initial;
  const factory SocialAuthState.loading() = Loading;
  const factory SocialAuthState.success(UserCredential user) = Success;
  const factory SocialAuthState.failure(String message) = Failure;
}
