part of 'phone_auth_cubit.dart';

@freezed
class PhoneAuthState with _$PhoneAuthState {
  const factory PhoneAuthState.initial() = Initial;
  const factory PhoneAuthState.loading() = Loading;
  const factory PhoneAuthState.failure(String message) = Failure;
  const factory PhoneAuthState.success({@Default("") String verificationId}) =
      Success;
}
