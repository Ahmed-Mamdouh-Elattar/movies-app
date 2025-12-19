import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/auth/domain/usecases/send_code_use_case.dart';
import 'package:movies_app/features/auth/domain/usecases/verify_code_use_case.dart';
import 'package:movies_app/features/auth/presentation/managers/phone_auth_cubit/phone_auth_cubit.dart';

import 'phone_auth_cubit_test.mocks.dart';

@GenerateMocks([SendCodeUseCase, VerifyCodeUseCase])
void main() {
  late MockSendCodeUseCase mockSendCodeUseCase;
  late MockVerifyCodeUseCase mockVerifyCodeUseCase;
  late PhoneAuthCubit phoneAuthCubit;
  const verificationId = "tVerificationId";
  const smsCode = "tSmsCode";

  setUp(() {
    mockSendCodeUseCase = MockSendCodeUseCase();
    mockVerifyCodeUseCase = MockVerifyCodeUseCase();
    phoneAuthCubit = PhoneAuthCubit(
      sendCodeUseCase: mockSendCodeUseCase,
      verifyCodeUseCase: mockVerifyCodeUseCase,
    );
  });

  tearDown(() {
    phoneAuthCubit.close();
  });

  group('PhoneAuthCubit', () {
    group("sendCode", () {
      test(
        'should emit [PhoneAuthLoading, PhoneAuthInitial] when sendCode is successful',
        () async {
          // arrange
          const expectedStates = [
            PhoneAuthState.loading(),
            PhoneAuthState.initial(),
          ];
          provideDummy<ResponseResult<String>>(
            const ResponseResult<String>.success("Success"),
          );
          when(mockSendCodeUseCase(any)).thenAnswer(
            (_) async => const ResponseResult<String>.success("Success"),
          );
          //assert
          expectLater(phoneAuthCubit.stream, emitsInOrder(expectedStates));

          // act
          phoneAuthCubit.sendCode('1234567890');
        },
      );
      test(
        'should emit [PhoneAuthLoading, PhoneAuthFailure] when sendCode fails',
        () async {
          // arrange
          const expectedStates = [
            PhoneAuthState.loading(),
            PhoneAuthState.failure("Something went wrong"),
          ];
          provideDummy<ResponseResult<String>>(
            const ResponseResult<String>.failure(
              Failures(errMessage: "Something went wrong"),
            ),
          );
          when(mockSendCodeUseCase(any)).thenAnswer(
            (_) async => const ResponseResult<String>.failure(
              Failures(errMessage: "Something went wrong"),
            ),
          );
          //assert
          expectLater(phoneAuthCubit.stream, emitsInOrder(expectedStates));

          // act
          phoneAuthCubit.sendCode('1234567890');
        },
      );
    });
    group("verifyCode", () {
      test(
        'should emit [PhoneAuthLoading, PhoneAuthSuccess] when verifyCode is successful',
        () async {
          // arrange
          const expectedStates = [
            PhoneAuthState.loading(),
            PhoneAuthState.success(),
          ];
          provideDummy<ResponseResult<String>>(
            const ResponseResult<String>.success("Success"),
          );
          when(mockVerifyCodeUseCase.call(verificationId, smsCode)).thenAnswer(
            (_) async => const ResponseResult<String>.success("Success"),
          );
          //assert
          expectLater(phoneAuthCubit.stream, emitsInOrder(expectedStates));

          // act
          phoneAuthCubit.verifyCode(smsCode, verificationId);
        },
      );
      test(
        'should emit [PhoneAuthLoading, PhoneAuthFailure] when verifyCode fails',
        () async {
          // arrange

          const expectedStates = [
            PhoneAuthState.loading(),
            PhoneAuthState.failure("Something went wrong"),
          ];
          provideDummy<ResponseResult<String>>(
            const ResponseResult<String>.failure(
              Failures(errMessage: "Something went wrong"),
            ),
          );
          when(mockVerifyCodeUseCase.call(verificationId, smsCode)).thenAnswer(
            (_) async => const ResponseResult<String>.failure(
              Failures(errMessage: "Something went wrong"),
            ),
          );
          //assert
          expectLater(phoneAuthCubit.stream, emitsInOrder(expectedStates));

          // act
          phoneAuthCubit.verifyCode(smsCode, verificationId);
        },
      );
    });
  });
}
