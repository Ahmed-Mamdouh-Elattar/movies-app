import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/auth/data/repositories/facebook_auth_repo_impl.dart';

import 'facebook_auth_repo_impl_test.mocks.dart';

@GenerateMocks([FirebaseAuth, FacebookAuth, UserCredential])
void main() {
  late MockFirebaseAuth firebaseAuth;
  late MockFacebookAuth facebookAuth;
  late FacebookAuthRepoImpl facebookAuthRepoImpl;
  setUp(() {
    firebaseAuth = MockFirebaseAuth();
    facebookAuth = MockFacebookAuth();
    facebookAuthRepoImpl = FacebookAuthRepoImpl(firebaseAuth, facebookAuth);
  });
  group("test facebook_auth_repo_impl", () {
    group("signInOrUp()", () {
      test(
        "should return userCredential when signInOrUp is called successfully",
        () async {
          // arrange
          final userCredential = MockUserCredential();
          when(
            facebookAuth.login(
              permissions: ['email', 'public_profile', 'user_photos'],
            ),
          ).thenAnswer((_) async => LoginResult(status: LoginStatus.success));
          when(
            firebaseAuth.signInWithCredential(any),
          ).thenAnswer((_) async => userCredential);
          // act
          final result = await facebookAuthRepoImpl.signInOrUp();
          // assert
          expect(
            result,
            ResponseResult<UserCredential>.success(userCredential),
          );
        },
      );
      test(
        "should return failure when signInOrUp is called with failure",
        () async {
          // arrange
          const expectedValue = ResponseResult<UserCredential>.failure(
            Failures(errMessage: "Signing process failed."),
          );
          when(
            facebookAuth.login(
              permissions: ['email', 'public_profile', 'user_photos'],
            ),
          ).thenAnswer((_) async => LoginResult(status: LoginStatus.failed));

          // act
          final result = await facebookAuthRepoImpl.signInOrUp();
          // assert
          expect(result, expectedValue);
        },
      );
    });
  });
}
