import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/core/utils/result.dart';
import 'package:movies_app/features/auth/domain/repositories/phone_auth_repo.dart';

class PhoneAuthRepoImpl implements PhoneAuthRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<Result<String>> sendCode(String phoneNumber) async {
    try {
      final completer = Completer<String>();

      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 120),

        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          completer.completeError(e);
        },
        codeSent: (verId, _) {
          completer.complete(verId);
        },
        codeAutoRetrievalTimeout: (verId) {
          completer.complete(verId);
        },
      );
      String verificationId = await completer.future;
      return Result.success(verificationId);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result<String>> verifyCode(
    String verificationId,
    String smsCode,
  ) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      await _auth.signInWithCredential(credential);
      return const Result.success("Success");
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
