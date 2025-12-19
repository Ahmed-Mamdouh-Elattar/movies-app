import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/core/utils/response_result.dart';
import 'package:movies_app/features/auth/domain/repositories/social_auth_repo.dart';

class FacebookAuthRepoImpl implements SocialAuthRepo {
  final FirebaseAuth _firebaseAuth;
  final FacebookAuth _facebookAuth;

  FacebookAuthRepoImpl(this._firebaseAuth, this._facebookAuth);

  @override
  Future<ResponseResult<UserCredential>> signInOrUp() async {
    // Trigger the sign-in flow

    final LoginResult loginResult = await _facebookAuth.login(
      permissions: ['email', 'public_profile', 'user_photos'],
    );
    final OAuthCredential facebookAuthCredential;
    // Create a credential from the access token
    if (loginResult.status == LoginStatus.success) {
      facebookAuthCredential = FacebookAuthProvider.credential(
        loginResult.accessToken?.tokenString ?? '',
      );
    } else if (loginResult.status == LoginStatus.cancelled) {
      return const ResponseResult.failure(
        Failures(errMessage: "Signing process was canceled."),
      );
    } else if (loginResult.status == LoginStatus.failed) {
      return const ResponseResult.failure(
        Failures(errMessage: "Signing process failed."),
      );
    } else if (loginResult.status == LoginStatus.operationInProgress) {
      return const ResponseResult.failure(
        Failures(errMessage: "Signing process is in progress."),
      );
    } else {
      return const ResponseResult.failure(
        Failures(
          errMessage:
              "An unexpected error occurred during signing. Please try again later.",
        ),
      );
    }

    // Once signed in, return the UserCredential
    return ResponseResult.success(
      await _firebaseAuth.signInWithCredential(facebookAuthCredential),
    );
  }
}
