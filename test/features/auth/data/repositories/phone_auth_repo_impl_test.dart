import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/auth/data/repositories/phone_auth_repo_impl.dart';

import '../../../../core/mocks/firebase_auth/firebase_auth.mocks.dart';
import '../../../../core/mocks/user_credential/user_credential.mocks.dart';

void main() {
  late PhoneAuthRepoImpl phoneAuthRepoImpl;
  late MockFirebaseAuth firebaseAuth;
  setUp(() {
    firebaseAuth = MockFirebaseAuth();
    phoneAuthRepoImpl = PhoneAuthRepoImpl(auth: firebaseAuth);
  });

  group("test phone_auth_repo_impl", () {
    group("sendCode", () {
      test(
        'should return ResponseResult<String> when sendCode success',
        () async {
          // Arrange
          const String tPhoneNumber = "+20123456789";
          const String tVerificationId = "tVerificationId";

          when(
            firebaseAuth.verifyPhoneNumber(
              phoneNumber: anyNamed('phoneNumber'),
              timeout: anyNamed('timeout'),
              verificationCompleted: anyNamed('verificationCompleted'),
              verificationFailed: anyNamed('verificationFailed'),
              codeSent: anyNamed('codeSent'),
              codeAutoRetrievalTimeout: anyNamed('codeAutoRetrievalTimeout'),
            ),
          ).thenAnswer((Invocation invocation) async {
            final codeSentCallback =
                invocation.namedArguments[const Symbol('codeSent')];
            codeSentCallback(tVerificationId, null);
          });
          // Act
          final result = await phoneAuthRepoImpl.sendCode(tPhoneNumber);
          // Assert
          expect(result, const ResponseResult.success(tVerificationId));
        },
      );
      test(
        "should return ResponseResult<String> when sendCode throws FirebaseAuthException",
        () async {
          // Arrange
          const String tPhoneNumber = "+20123456789";

          when(
            firebaseAuth.verifyPhoneNumber(
              phoneNumber: anyNamed('phoneNumber'),
              timeout: anyNamed('timeout'),
              verificationCompleted: anyNamed('verificationCompleted'),
              verificationFailed: anyNamed('verificationFailed'),
              codeSent: anyNamed('codeSent'),
              codeAutoRetrievalTimeout: anyNamed('codeAutoRetrievalTimeout'),
            ),
          ).thenAnswer((Invocation invocation) async {
            final verificationFailedCallback =
                invocation.namedArguments[const Symbol('verificationFailed')];
            verificationFailedCallback(
              FirebaseAuthException(
                code: 'invalid-phone-number',
                message: 'Invalid phone number',
              ),
            );
          });
          // Act
          final result = await phoneAuthRepoImpl.sendCode(tPhoneNumber);
          // Assert
          expect(
            result,
            isA<ResponseResult<String>>().having(
              (result) => result.when(
                success: (success) => success,
                failure: (failure) => failure.errMessage,
              ),
              'failure',
              'Invalid phone number',
            ),
          );
        },
      );

      test(
        'should return ResponseResult<String> when sendCode throws exception',
        () async {
          // Arrange
          const String tPhoneNumber = "+20123456789";

          when(
            firebaseAuth.verifyPhoneNumber(
              phoneNumber: anyNamed('phoneNumber'),
              timeout: anyNamed('timeout'),
              verificationCompleted: anyNamed('verificationCompleted'),
              verificationFailed: anyNamed('verificationFailed'),
              codeSent: anyNamed('codeSent'),
              codeAutoRetrievalTimeout: anyNamed('codeAutoRetrievalTimeout'),
            ),
          ).thenAnswer((Invocation invocation) async {
            throw Exception('Failed to send verification code');
          });
          // Act
          final result = await phoneAuthRepoImpl.sendCode(tPhoneNumber);
          // Assert
          expect(
            result,
            isA<ResponseResult<String>>().having(
              (result) => result.when(
                success: (success) => success,
                failure: (failure) => failure.errMessage,
              ),
              'failure',
              'Exception: Failed to send verification code',
            ),
          );
        },
      );
    });
    group("verifyCode", () {
      test(
        'should return ResponseResult<String> when verifyCode success',
        () async {
          // Arrange
          const String tVerificationId = "tVerificationId";
          const String tSmsCode = "tSmsCode";

          when(firebaseAuth.signInWithCredential(any)).thenAnswer((
            Invocation invocation,
          ) async {
            return MockUserCredential();
          });
          // Act
          final result = await phoneAuthRepoImpl.verifyCode(
            tVerificationId,
            tSmsCode,
          );
          // Assert
          expect(result, const ResponseResult<String>.success("Success"));
        },
      );
      test(
        'should return ResponseResult<String> when verifyCode throws FirebaseAuthException',
        () async {
          // Arrange
          const String tVerificationId = "tVerificationId";
          const String tSmsCode = "tSmsCode";

          when(firebaseAuth.signInWithCredential(any)).thenAnswer((
            Invocation invocation,
          ) async {
            throw FirebaseAuthException(
              code: 'invalid-verification-id',
              message: 'Invalid verification ID',
            );
          });
          // Act
          final result = await phoneAuthRepoImpl.verifyCode(
            tVerificationId,
            tSmsCode,
          );
          // Assert
          expect(
            result,
            isA<ResponseResult<String>>().having(
              (result) => result.when(
                success: (success) => success,
                failure: (failure) => failure.errMessage,
              ),
              'failure',
              'Invalid verification ID',
            ),
          );
        },
      );
      test(
        'should return ResponseResult<String> when verifyCode throws exception',
        () async {
          // Arrange
          const String tVerificationId = "tVerificationId";
          const String tSmsCode = "tSmsCode";

          when(firebaseAuth.signInWithCredential(any)).thenAnswer((
            Invocation invocation,
          ) async {
            throw Exception('Failed to verify code');
          });
          // Act
          final result = await phoneAuthRepoImpl.verifyCode(
            tVerificationId,
            tSmsCode,
          );
          // Assert
          expect(
            result,
            isA<ResponseResult<String>>().having(
              (result) => result.when(
                success: (success) => success,
                failure: (failure) => failure.errMessage,
              ),
              'failure',
              'Exception: Failed to verify code',
            ),
          );
        },
      );
    });
  });
}
