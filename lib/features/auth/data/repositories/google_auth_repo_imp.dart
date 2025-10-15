import 'dart:developer';

import 'package:movies_app/core/utils/result.dart';
import 'package:movies_app/features/auth/domain/repositories/social_auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthRepoImp implements SocialAuthRepo {
  @override
  Future<Result<UserCredential>> signInOrUp() async {
    // Trigger the authentication flow
    try {
      final GoogleSignIn googleUser = GoogleSignIn.instance;
      await googleUser.initialize();
      final GoogleSignInAccount googleUserAccount = await googleUser
          .authenticate();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          googleUserAccount.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return Result.success(
        await FirebaseAuth.instance.signInWithCredential(credential),
      );
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return const Result.failure("Signing process was canceled.");
      } else if (e.code == GoogleSignInExceptionCode.clientConfigurationError) {
        return const Result.failure(
          "Signing failed. Please contact support (Client configuration error).",
        );
      } else if (e.code ==
          GoogleSignInExceptionCode.providerConfigurationError) {
        return const Result.failure(
          "Signing failed due to a server configuration issue. Please try again later.",
        );
      } else if (e.code == GoogleSignInExceptionCode.uiUnavailable) {
        return const Result.failure(
          "Could not display the signing screen. Please try again.",
        );
      } else if (e.code == GoogleSignInExceptionCode.unknownError) {
        return const Result.failure(
          "An unknown error occurred during signing. Please try again.",
        );
      } else if (e.code == GoogleSignInExceptionCode.userMismatch) {
        return const Result.failure(
          "The signing user does not match the expected user. Please try again with the correct account.",
        );
      } else if (e.code == GoogleSignInExceptionCode.interrupted) {
        return const Result.failure(
          "The signig process was interrupted. Please try again.",
        );
      } else {
        return const Result.failure(
          "An unexpected error occurred during signing. Please try again later.",
        );
      }
    } on Exception catch (e) {
      log(e.toString());
      return const Result.failure(
        "An unexpected error occurred. Please try again later.",
      );
    }
  }
}
