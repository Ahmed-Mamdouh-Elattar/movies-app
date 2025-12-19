import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/auth/data/repositories/google_auth_repo_imp.dart';

import 'google_auth_repo_imp_test.mocks.dart';

@GenerateMocks([
  FirebaseAuth,
  GoogleSignIn,
  UserCredential,
  GoogleSignInAccount,
  GoogleSignInAuthentication,
])
void main() {
  late GoogleAuthRepoImp googleAuthRepoImp;
  late GoogleSignIn googleSignIn;
  late MockFirebaseAuth firebaseAuth;

  setUp(() {
    googleSignIn = MockGoogleSignIn();
    firebaseAuth = MockFirebaseAuth();
    googleAuthRepoImp = GoogleAuthRepoImp(
      googleSignIn: googleSignIn,
      firebaseAuth: firebaseAuth,
    );
  });
  group("test GoogleAuthRepoImp", () {
    group("test signInWithGoogle", () {
      test(
        "should sign in with google when call to signInOrUp is successful",
        () async {
          //arrange
          final userCredential = MockUserCredential();
          final expectedValue = ResponseResult<UserCredential>.success(
            userCredential,
          );
          final googleSignInAccount = MockGoogleSignInAccount();
          final googleSignInAuthentication = MockGoogleSignInAuthentication();
          when(
            googleSignIn.initialize(),
          ).thenAnswer((_) async => Future.value());
          when(
            googleSignIn.authenticate(),
          ).thenAnswer((_) async => googleSignInAccount);
          when(
            googleSignInAccount.authentication,
          ).thenAnswer((_) => googleSignInAuthentication);
          when(googleSignInAuthentication.idToken).thenReturn("idToken");
          when(
            firebaseAuth.signInWithCredential(any),
          ).thenAnswer((_) async => userCredential);
          //act
          final result = await googleAuthRepoImp.signInOrUp();
          //assert
          expect(result, expectedValue);
        },
      );
      test(
        "should return ResponseResult<UserCredential> and message from googleSignInException when call to signInOrUp fails",
        () async {
          //arrange
          const expectedValue = ResponseResult<UserCredential>.failure(
            Failures(
              errMessage:
                  "An unknown error occurred during signing. Please try again.",
            ),
          );
          when(
            googleSignIn.initialize(),
          ).thenAnswer((_) async => Future.value());
          when(googleSignIn.authenticate()).thenAnswer(
            (_) async => throw const GoogleSignInException(
              code: GoogleSignInExceptionCode.unknownError,
            ),
          );

          //act
          final result = await googleAuthRepoImp.signInOrUp();
          //assert
          expect(result, expectedValue);
        },
      );
      test(
        "should return ResponseResult<UserCredential> and message from any exception when call to signInOrUp fails",
        () async {
          //arrange
          const expectedValue = ResponseResult<UserCredential>.failure(
            Failures(
              errMessage:
                  "An unexpected error occurred. Please try again later.",
            ),
          );

          when(
            googleSignIn.initialize(),
          ).thenAnswer((_) async => Future.value());
          when(
            googleSignIn.authenticate(),
          ).thenAnswer((_) async => throw Exception("any exception"));

          //act
          final result = await googleAuthRepoImp.signInOrUp();
          //assert
          expect(result, expectedValue);
        },
      );
    });
  });
}
