import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/auth/domain/usecases/sign_in_or_up_with_facebook_use_case.dart';
import 'package:movies_app/features/auth/domain/usecases/sign_in_or_up_with_google_use_case.dart';
import 'package:movies_app/features/auth/presentation/managers/social_auth_cubit/social_auth_cubit.dart';

import '../../../../../core/mocks/user_credential/user_credential.mocks.dart';
import 'social_auth_cubit_test.mocks.dart';

@GenerateMocks([SignInOrUpWithGoogleUseCase, SignInOrUpWithFacebookUseCase])
void main() {
  late SocialAuthCubit socialAuthCubit;
  late MockSignInOrUpWithGoogleUseCase signInOrUpWithGoogleUseCase;
  late MockSignInOrUpWithFacebookUseCase signInOrUpWithFacebookUseCase;
  setUp(() {
    signInOrUpWithGoogleUseCase = MockSignInOrUpWithGoogleUseCase();
    signInOrUpWithFacebookUseCase = MockSignInOrUpWithFacebookUseCase();
    socialAuthCubit = SocialAuthCubit(
      signInOrUpWithGoogleUseCase,
      signInOrUpWithFacebookUseCase,
    );
  });

  tearDown(() {
    socialAuthCubit.close();
  });
  group("test SocialAuthCubit", () {
    group("signInOrUpWithGoogle", () {
      test(
        "should emit [SocialAuthState.loading, SocialAuthState.success] when signInOrUpWithGoogle is successful",
        () async {
          //arrange
          final user = MockUserCredential();
          final expectedStates = [
            const SocialAuthState.loading(),
            SocialAuthState.success(user),
          ];
          provideDummy<ResponseResult<UserCredential>>(
            ResponseResult.success(user),
          );
          when(
            signInOrUpWithGoogleUseCase.call(),
          ).thenAnswer((_) async => ResponseResult.success(user));
          //assert
          expectLater(socialAuthCubit.stream, emitsInOrder(expectedStates));
          //act
          socialAuthCubit.signInOrUpWithGoogle();
        },
      );
      test(
        "should emit [SocialAuthState.loading, SocialAuthState.failure] when signInOrUpWithGoogle fails",
        () async {
          //arrange
          final expectedStates = [
            const SocialAuthState.loading(),
            const SocialAuthState.failure("error"),
          ];
          provideDummy<ResponseResult<UserCredential>>(
            const ResponseResult.failure(Failures(errMessage: "error")),
          );
          when(signInOrUpWithGoogleUseCase.call()).thenAnswer(
            (_) async =>
                const ResponseResult.failure(Failures(errMessage: "error")),
          );
          //assert
          expectLater(socialAuthCubit.stream, emitsInOrder(expectedStates));
          //act
          socialAuthCubit.signInOrUpWithGoogle();
        },
      );
    });
    group("signInOrUpWithFacebook", () {
      test(
        "should emit [SocialAuthState.loading, SocialAuthState.success] when signInOrUpWithFacebook is successful",
        () async {
          //arrange
          final user = MockUserCredential();
          final expectedStates = [
            const SocialAuthState.loading(),
            SocialAuthState.success(user),
          ];
          provideDummy<ResponseResult<UserCredential>>(
            ResponseResult.success(user),
          );
          when(
            signInOrUpWithFacebookUseCase.call(),
          ).thenAnswer((_) async => ResponseResult.success(user));
          //assert
          expectLater(socialAuthCubit.stream, emitsInOrder(expectedStates));
          //act
          socialAuthCubit.signInOrUpWithFacebook();
        },
      );
      test(
        "should emit [SocialAuthState.loading, SocialAuthState.failure] when signInOrUpWithFacebook fails",
        () async {
          //arrange
          final expectedStates = [
            const SocialAuthState.loading(),
            const SocialAuthState.failure("error"),
          ];
          provideDummy<ResponseResult<UserCredential>>(
            const ResponseResult.failure(Failures(errMessage: "error")),
          );
          when(signInOrUpWithFacebookUseCase.call()).thenAnswer(
            (_) async =>
                const ResponseResult.failure(Failures(errMessage: "error")),
          );
          //assert
          expectLater(socialAuthCubit.stream, emitsInOrder(expectedStates));
          //act
          socialAuthCubit.signInOrUpWithFacebook();
        },
      );
    });
  });
}
