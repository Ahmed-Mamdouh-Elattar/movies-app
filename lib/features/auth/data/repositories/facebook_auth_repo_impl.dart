import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/core/utils/result.dart';
import 'package:movies_app/features/auth/domain/repositories/social_auth_repo.dart';

class FacebookAuthRepoImpl implements SocialAuthRepo {
  @override
  Future<Result<UserCredential>> signInOrUp() async {
    // Trigger the sign-in flow

    final LoginResult loginResult = await FacebookAuth.instance.login(
      permissions: ['email', 'public_profile', 'user_photos'],
    );
    final OAuthCredential facebookAuthCredential;
    // Create a credential from the access token
    if (loginResult.status == LoginStatus.success) {
      facebookAuthCredential = FacebookAuthProvider.credential(
        loginResult.accessToken!.tokenString,
      );
    } else if (loginResult.status == LoginStatus.cancelled) {
      return const Result.failure(
        Failures(errMessage: "Signing process was canceled."),
      );
    } else if (loginResult.status == LoginStatus.failed) {
      return const Result.failure(
        Failures(errMessage: "Signing process failed."),
      );
    } else if (loginResult.status == LoginStatus.operationInProgress) {
      return const Result.failure(
        Failures(errMessage: "Signing process is in progress."),
      );
    } else {
      return const Result.failure(
        Failures(
          errMessage:
              "An unexpected error occurred during signing. Please try again later.",
        ),
      );
    }

    // Once signed in, return the UserCredential
    return Result.success(
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential),
    );
  }
}
