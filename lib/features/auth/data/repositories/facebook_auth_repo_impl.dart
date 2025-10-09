import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:movies_app/core/utils/result.dart';
import 'package:movies_app/features/auth/domain/repositories/auth_repo.dart';

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
      return const Result.failure("Signing process was canceled.");
    } else if (loginResult.status == LoginStatus.failed) {
      return const Result.failure("Signing failed.");
    } else if (loginResult.status == LoginStatus.operationInProgress) {
      return const Result.failure("Signing process is in progress.");
    } else {
      return const Result.failure("Unknown error occurred.");
    }

    // Once signed in, return the UserCredential
    return Result.success(
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential),
    );
  }
}
